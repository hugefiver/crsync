@0xfaf73f229639ac2c;

const version = 10001;

struct FileTar {
    version @0 :Int64 = .version;

    pack_id @1 :Int64;

    changes @2 :List(FileChange);
}

struct FileChange {
    status @0 :Status;

    meta @1 :FileMeta;

    union {
        blocks :List(FileBlock) = @2;
        empty :Void = @3;
    }

    enum Status {
        updated = 0;
        deteled = 1;
    }

    struct FileMeta {
        path @0 :Text;
        create_time @1 :Int64;
        update_time @2 :Int64;
        hash @3 :Hash;


    }
    
    struct FileBlock {
        block_id @0 :Text;
        offset @1 :UInt64;
        size @2 :UInt64;
    }
}

struct Block {
    block_id @0 :Text;
    block_kind @1 :Kind;
    meta @2 :Meta;

    union {
        sublocks @3 :List(Sublock);
        nonsublocks @4 :Void;
    }

    enum Kind {
        full = 0;
        compact = 1;
        aggregated = 2;
    }

    struct Meta {
        size @0 :UInt64;
        hash @1 :Hash;
    }

    struct Sublock {
        offset @0 :UInt64;
        size @1 :UInt64;
    }
}

struct Hash {
    method @0 :Method;
    hash @1 :Data;

    enum Method {
        Sha256 = 0;
    }
}