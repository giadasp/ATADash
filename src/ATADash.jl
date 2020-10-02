module ATADash
import JLD2
import Dash
import DashHtmlComponents
import DashCoreComponents

using Requires

function __init__()
    @require ATA = "a8b2d192-9814-11e9-3a67-ff0161457e0c" begin
        include("dash.jl")
    end
end

export ATA_app

end # module