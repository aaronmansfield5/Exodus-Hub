local Execution = {}

local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/aaronmansfield5/Exodus-Hub/dev/modules/utils.lua"))()

function Execution.Execute(Script, v, Fluent, Window) 
    local name, version = getexecutorname()
    if not Script.Key then
        if(_G.SmartExec and v.PlaceId) then
            if(game.PlaceId == v.PlaceId) then
                if(not v.Denied) then
                    Fluent:Notify({
                        Title = "Script Execution",
                        Content = "Now executing "..v.Title,
                        SubContent = "Exodus Hub",
                        Duration = 5
                    })
                    loadstring(game:HttpGet(v.URL, false))()
                elseif(Utils.Includes(v.Denied, name)) then
                    Window:Dialog({
                        Title = "Disclaimer",
                        Content = "We have detected that you're using "..name.."; as a result '"..v.Title.."' may not run as expected.",
                        Buttons = {
                            { 
                                Title = "Execute",
                                Callback = function()
                                    Fluent:Notify({
                                        Title = "Script Execution",
                                        Content = "Now executing "..v.Title,
                                        SubContent = "Exodus Hub",
                                        Duration = 5
                                    })
                                    loadstring(game:HttpGet(v.URL, false))()
                                end 
                            }, {
                                Title = "Cancel",
                                Callback = function()
                                    
                                end 
                            }
                        }
                    })
                else
                    Fluent:Notify({
                        Title = "Script Execution",
                        Content = "Now executing "..v.Title,
                        SubContent = "Exodus Hub",
                        Duration = 5
                    })
                    loadstring(game:HttpGet(v.URL, false))()
                end
            else
                Window:Dialog({
                    Title = "Disclaimer",
                    Content = "Smart Execution has detected that you are not in the game intended for "..v.Title..". Would you like to execute anyway?",
                    Buttons = {
                        { 
                            Title = "Execute",
                            Callback = function()
                                Fluent:Notify({
                                    Title = "Script Execution",
                                    Content = "Now executing "..v.Title,
                                    SubContent = "Exodus Hub",
                                    Duration = 5
                                })
                                loadstring(game:HttpGet(v.URL, false))()
                            end
                        }, {
                            Title = "Cancel",
                            Callback = function()
                                
                            end 
                        }
                    }
                })
            end
        else
            if(not v.Denied) then
                Fluent:Notify({
                    Title = "Script Execution",
                    Content = "Now executing "..v.Title,
                    SubContent = "Exodus Hub",
                    Duration = 5
                })
                loadstring(game:HttpGet(v.URL, false))()
            elseif(Utils.Includes(v.Denied, name)) then
                Window:Dialog({
                    Title = "Disclaimer",
                    Content = "We have detected that you're using "..name.."; as a result '"..v.Title.."' may not run as expected.",
                    Buttons = {
                        { 
                            Title = "Execute",
                            Callback = function()
                                Fluent:Notify({
                                    Title = "Script Execution",
                                    Content = "Now executing "..v.Title,
                                    SubContent = "Exodus Hub",
                                    Duration = 5
                                })
                                loadstring(game:HttpGet(v.URL, false))()
                            end 
                        }, {
                            Title = "Cancel",
                            Callback = function()
                                
                            end 
                        }
                    }
                })
            else
                Fluent:Notify({
                    Title = "Script Execution",
                    Content = "Now executing "..v.Title,
                    SubContent = "Exodus Hub",
                    Duration = 5
                })
                loadstring(game:HttpGet(v.URL, false))()
            end
        end
    elseif(v.Title == "Huge Games") then
            getgenv().AuthKey = Script.Key
            if(_G.SmartExec and v.PlaceId) then
                if(v.PlaceId ~= game.PlaceId) then
                    Window:Dialog({
                        Title = "Disclaimer",
                        Content = "Smart Execution has detected that you are not in the game intended for "..v.Title..". Would you like to execute anyway?",
                        Buttons = {
                            { 
                                Title = "Execute",
                                Callback = function()
                                    Fluent:Notify({
                                        Title = "Script Execution",
                                        Content = "Now executing "..v.Title,
                                        SubContent = "Exodus Hub",
                                        Duration = 5
                                    })
                                    loadstring(game:HttpGet(v.URL, false))()
                                end
                            }, {
                                Title = "Cancel",
                                Callback = function()
                                    
                                end 
                            }
                        }
                    })
                else
                    if(not v.Denied) then
                        Fluent:Notify({
                            Title = "Script Execution",
                            Content = "Now executing "..v.Title,
                            SubContent = "Exodus Hub",
                            Duration = 5
                        })
                        loadstring(game:HttpGet(v.URL, false))()
                    elseif(Utils.Includes(v.Denied, name)) then
                        Window:Dialog({
                            Title = "Disclaimer",
                            Content = "We have detected that you're using "..name.."; as a result '"..v.Title.."' may not run as expected.",
                            Buttons = {
                                { 
                                    Title = "Execute",
                                    Callback = function()
                                        Fluent:Notify({
                                            Title = "Script Execution",
                                            Content = "Now executing "..v.Title,
                                            SubContent = "Exodus Hub",
                                            Duration = 5
                                        })
                                        loadstring(game:HttpGet(v.URL, false))()
                                    end 
                                }, {
                                    Title = "Cancel",
                                    Callback = function()
                                        
                                    end 
                                }
                            }
                        })
                    else
                        Fluent:Notify({
                            Title = "Script Execution",
                            Content = "Now executing "..v.Title,
                            SubContent = "Exodus Hub",
                            Duration = 5
                        })
                        loadstring(game:HttpGet(v.URL, false))()
                    end
                end
            else
                if(not v.Denied) then
                    Fluent:Notify({
                        Title = "Script Execution",
                        Content = "Now executing "..v.Title,
                        SubContent = "Exodus Hub",
                        Duration = 5
                    })
                    loadstring(game:HttpGet(v.URL, false))()
                elseif(Utils.Includes(v.Denied, name)) then
                    Window:Dialog({
                        Title = "Disclaimer",
                        Content = "We have detected that you're using "..name.."; as a result '"..v.Title.."' may not run as expected.",
                        Buttons = {
                            { 
                                Title = "Execute",
                                Callback = function()
                                    Fluent:Notify({
                                        Title = "Script Execution",
                                        Content = "Now executing "..v.Title,
                                        SubContent = "Exodus Hub",
                                        Duration = 5
                                    })
                                    loadstring(game:HttpGet(v.URL, false))()
                                end 
                            }, {
                                Title = "Cancel",
                                Callback = function()
                                    
                                end 
                            }
                        }
                    })
                else
                    Fluent:Notify({
                        Title = "Script Execution",
                        Content = "Now executing "..v.Title,
                        SubContent = "Exodus Hub",
                        Duration = 5
                    })
                    loadstring(game:HttpGet(v.URL, false))()
                end
            end
        elseif(v.Title == "Universal Aimbot") then
            getgenv().mainKey = Script.Key
            if(_G.SmartExec and v.PlaceId) then
                if(v.PlaceId ~= game.PlaceId) then
                    Window:Dialog({
                        Title = "Disclaimer",
                        Content = "Smart Execution has detected that you are not in the game intended for "..v.Title..". Would you like to execute anyway?",
                        Buttons = {
                            { 
                                Title = "Execute",
                                Callback = function()
                                    Fluent:Notify({
                                        Title = "Script Execution",
                                        Content = "Now executing "..v.Title,
                                        SubContent = "Exodus Hub",
                                        Duration = 5
                                    })
                                    local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
                                end
                            }, {
                                Title = "Cancel",
                                Callback = function()
                                    
                                end 
                            }
                        }
                    })
                else
                    if(not v.Denied) then
                        Fluent:Notify({
                            Title = "Script Execution",
                            Content = "Now executing "..v.Title,
                            SubContent = "Exodus Hub",
                            Duration = 5
                        })
                        local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
                    elseif(Utils.Includes(v.Denied, name)) then
                        Window:Dialog({
                            Title = "Disclaimer",
                            Content = "We have detected that you're using "..name.."; as a result '"..v.Title.."' may not run as expected.",
                            Buttons = {
                                { 
                                    Title = "Execute",
                                    Callback = function()
                                        Fluent:Notify({
                                            Title = "Script Execution",
                                            Content = "Now executing "..v.Title,
                                            SubContent = "Exodus Hub",
                                            Duration = 5
                                        })
                                        
                        local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
                                    end 
                                }, {
                                    Title = "Cancel",
                                    Callback = function()
                                        
                                    end 
                                }
                            }
                        })
                    else
                        Fluent:Notify({
                            Title = "Script Execution",
                            Content = "Now executing "..v.Title,
                            SubContent = "Exodus Hub",
                            Duration = 5
                        })
                        local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
                    end
                end
            else
                if(not v.Denied) then
                    Fluent:Notify({
                        Title = "Script Execution",
                        Content = "Now executing "..v.Title,
                        SubContent = "Exodus Hub",
                        Duration = 5
                    })
                    local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
                elseif(Utils.Includes(v.Denied, name)) then
                    Window:Dialog({
                        Title = "Disclaimer",
                        Content = "We have detected that you're using "..name.."; as a result '"..v.Title.."' may not run as expected.",
                        Buttons = {
                            { 
                                Title = "Execute",
                                Callback = function()
                                    Fluent:Notify({
                                        Title = "Script Execution",
                                        Content = "Now executing "..v.Title,
                                        SubContent = "Exodus Hub",
                                        Duration = 5
                                    })
                                    
                        local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
                                end 
                            }, {
                                Title = "Cancel",
                                Callback = function()
                                    
                                end 
                            }
                        }
                    })
                else
                    Fluent:Notify({
                        Title = "Script Execution",
                        Content = "Now executing "..v.Title,
                        SubContent = "Exodus Hub",
                        Duration = 5
                    })
                    local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
                end
            end
        end
    end

return Execution