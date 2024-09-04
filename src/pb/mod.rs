pub(crate) mod proto_capnp {
    include!("proto_capnp.rs");
}

pub use proto_capnp::{block, file_change, file_tar, hash, VERSION};
