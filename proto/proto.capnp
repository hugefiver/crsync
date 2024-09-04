@0xfaf73f229639ac2c;

const version :Int64 = 10001;

struct FileTar {
    version @0 :Int64 = .version;
    # schema version

    packId @1 :Int64;
    # increasing number

    changes @2 :List(FileChange);
}

struct FileChange {
    id @0 :Int64;

    status @1 :Status;

    meta @2 :FileMeta;

    union {
        blocks @3 :List(FileBlock);
        empty @4 :Void;
    }

    enum Status {
        updated @0;
        deteled @1;
    }

    struct FileMeta {
        path @0 :Text;
        createTime @1 :Int64;
        updateTime @2 :Int64;
        hash @3 :Hash;
    }
    
    struct FileBlock {
        blockId @0 :Text;
        offset @1 :UInt64;
        size @2 :UInt64;
    }
}

struct Block {
    blockId @0 :Text;
    # encode with hex chars

    blockKind @1 :Kind;

    meta @2 :Meta;

    encrypt @3 :Encrypt;

    union {
        sublocks @4 :List(Sublock);

        nonSublocks @5 :Void;
        # for `full` kind block
    }

    enum Kind {
        full @0;
        # only one sublock

        compact @1;
        # compact with serval encrypted sublock

        aggregated @2;
        # sublocks together then encrypted
    }

    struct Meta {
        size @0 :UInt64;
        blockHash @1 :Hash;

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
        sha256 @0;
    }
}

struct Encrypt {
    algo @0 :Algo;
    key @1 :Data;

    enum Algo {
        aes256Gcm @0;
    }
}