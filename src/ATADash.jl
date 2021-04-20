module ATADash
using Base64
using JLD2
using DataFrames
using Dash
using DashHtmlComponents
using DashCoreComponents
using DashTable
using Serialization
using HTTP
using CSV

using Requires
function __init__()
    @require ATA = "a8b2d192-9814-11e9-3a67-ff0161457e0c" begin
        include("dash.jl")
    end
end

export ata_app

end # module
