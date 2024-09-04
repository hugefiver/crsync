fn main() {
    capnpc::CompilerCommand::new()
        .default_parent_module(vec!["pb".to_string()])
        .src_prefix("proto")
        .file("proto/proto.capnp")
        .output_path("src/pb")
        .run()
        .expect("compiling protos");
}