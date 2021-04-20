function serialize_ata(x)
    # IObuffer function to convert 
    # object to byte streams
    io = IOBuffer()
    # Serialize function takes stream 
    # and value as parameters
    Serialization.serialize(io, x)
    # take! Function fetches IOBUffer contents 
    # as Byte array and resets
    s = take!(io)
    #t = String(s);
    return s#::String
end

function serialize_ata()
    m = ATA.NoObjModel()
    t = serialize_ata(m)
    return t
end

function deserialize_ata(t)
    # Deserialize function takes stream as parameter
    ds = Serialization.deserialize(IOBuffer(String(Vector{UInt8}(t))))
    return ds
end
