#[macro_use]
extern crate lazy_static;

use std::fs::File;
use std::io::BufReader;

use rodio::{Decoder, OutputStream, Sink};

rustler::atoms! {
    ok,
    error,
}

rustler::init!("Elixir.Speakers.NifAudio"); // ← remove the deprecated list to silence the warning

lazy_static! {
    static ref CURRENT_SINK: Sink = {
        let (stream, handle) = OutputStream::try_default()
            .expect("Failed to open default audio output device - check audio setup in Docker/host");
        std::mem::forget(stream);  // ← key line: keep stream alive forever
        Sink::try_new(&handle).expect("Failed to create sink")
    };
}

#[rustler::nif]
fn pause() -> rustler::Atom {
    CURRENT_SINK.pause();
    ok()
}

#[rustler::nif]
fn resume() -> rustler::Atom {
    CURRENT_SINK.play();
    ok()
}

#[rustler::nif]
fn get_queue_len() -> (rustler::Atom, usize) {
    (ok(), CURRENT_SINK.len())
}

#[rustler::nif]
fn add_to_queue(file_path: &str) -> rustler::Atom {
    let file = match File::open(file_path) {
        Ok(f) => f,
        Err(_) => return error(),
    };

    let source = match Decoder::new(BufReader::new(file)) {
        Ok(dec) => dec,
        Err(_) => return error(),
    };

    CURRENT_SINK.append(source);
    ok()
}

#[rustler::nif]
fn get_volume() -> (rustler::Atom, f32) {
    (ok(), CURRENT_SINK.volume())
}

#[rustler::nif]
fn set_volume(new_volume: f32) -> (rustler::Atom, f32) {
    CURRENT_SINK.set_volume(new_volume);
    (ok(), new_volume)
}
