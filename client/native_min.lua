_G["ESX"],_G["xPlayer"],_G["source"],_G["developer"]=nil,{},GetPlayerServerId(PlayerId()),function()end;local a,b,c,d,e,f,g,h,i,j,k,l,m,o,p,q,r,s,t=AddTextEntry,BeginTextCommandDisplayHelp,EndTextCommandDisplayHelp,SetNotificationTextEntry,AddTextComponentSubstringPlayerName,DrawNotification,GetEntityCoords,World3dToScreen2d,SetTextScale,SetTextFont,SetTextEntry,SetTextCentre,AddTextComponentString,DrawText,DoesEntityExist,GetDistanceBetweenCoords,GetPlayerPed,TriggerEvent,TriggerServerEvent;local u=GetCurrentResourceName()local v={["ESC"]=322,["F1"]=288,["F2"]=289,["F3"]=170,["F5"]=166,["F6"]=167,["F7"]=168,["F8"]=169,["F9"]=56,["F10"]=57,["~"]=243,["1"]=157,["2"]=158,["3"]=160,["4"]=164,["5"]=165,["6"]=159,["7"]=161,["8"]=162,["9"]=163,["-"]=84,["="]=83,["BACKSPACE"]=177,["TAB"]=37,["Q"]=44,["W"]=32,["E"]=38,["R"]=45,["T"]=245,["Y"]=246,["U"]=303,["P"]=199,["["]=39,["]"]=40,["ENTER"]=18,["CAPS"]=137,["A"]=34,["S"]=8,["D"]=9,["F"]=23,["G"]=47,["H"]=74,["K"]=311,["L"]=182,["LEFTSHIFT"]=21,["Z"]=20,["X"]=73,["C"]=26,["V"]=0,["B"]=29,["N"]=249,["M"]=244,[","]=82,["."]=81,["LEFTCTRL"]=36,["LEFTALT"]=19,["SPACE"]=22,["RIGHTCTRL"]=70,["HOME"]=213,["PAGEUP"]=10,["PAGEDOWN"]=11,["DELETE"]=178,["LEFT"]=174,["RIGHT"]=175,["TOP"]=27,["DOWN"]=173,["NENTER"]=201,["N4"]=108,["N5"]=60,["N6"]=107,["N+"]=96,["N-"]=97,["N7"]=117,["N8"]=61,["N9"]=118}_G["Utility"]={Cache={PlayerPedId=PlayerPedId(),Marker={},Object={},Dialogue={},Blips={},N3d={},Events={},SetData={},Frozen={},FlowDetector={},Constant={},Loop={},SliceGroups={}}}On=function(type,w,x)RegisterNetEvent("Utility:On:"..(x and"!"or"")..type)local y=AddEventHandler("Utility:On:"..(x and"!"or"")..type,w)table.insert(Utility.Cache.Events,y)end;_G.old_TaskVehicleDriveToCoord=TaskVehicleDriveToCoord;TaskVehicleDriveToCoord=function(z,A,B,C,D)old_TaskVehicleDriveToCoord(z,A,B,C or 10.0,0,GetEntityModel(A),2883621,D or 1.0)end;_G.old_DisableControlAction=DisableControlAction;DisableControlAction=function(E,F)return old_DisableControlAction(0,v[string.upper(E)],true or F)end;DisableControlForSeconds=function(E,G)local H=G;Citizen.CreateThread(function()while H>0 do Citizen.Wait(1000)H=H-1 end;return end)Citizen.CreateThread(function()while H>0 do DisableControlAction(v[string.upper(E)])Citizen.Wait(1)end;return end)end;_G.old_IsControlJustPressed=IsControlJustPressed;IsControlJustPressed=function(I,J)developer("^2Created^0","key map",I)RegisterKeyMapping('utility '..u..' '..I,'',"keyboard",I)table.insert(Utility.Cache.Events,AddEventHandler("Utility:Pressed_"..u.."_"..I,J))end;ShowNotification=function(K)d('STRING')e(K)f(false,true)end;ButtonNotification=function(K)if string.match(K,"{.*}")then K=string.multigsub(K,{"{A}","{B}","{C}","{D}","{E}","{F}","{G}","{H}","{L}","{M}","{N}","{O}","{P}","{Q}","{R}","{S}","{T}","{U}","{V}","{W}","{X}","{Y}","{Z}"},{"~INPUT_VEH_FLY_YAW_LEFT~","~INPUT_SPECIAL_ABILITY_SECONDARY~","~INPUT_LOOK_BEHIND~","~INPUT_MOVE_LR~","~INPUT_CONTEXT~","~INPUT_ARREST~","~INPUT_DETONATE~","~INPUT_VEH_ROOF~","~INPUT_CELLPHONE_CAMERA_FOCUS_LOCK~","~INPUT_INTERACTION_MENU~","~INPUT_REPLAY_ENDPOINT~","~INPUT_FRONTEND_PAUSE~","~INPUT_FRONTEND_LB~","~INPUT_RELOAD~","~INPUT_MOVE_DOWN_ONLY~","~INPUT_MP_TEXT_CHAT_ALL~","~INPUT_REPLAY_SCREENSHOT~","~INPUT_NEXT_CAMERA~","~INPUT_MOVE_UP_ONLY~","~INPUT_VEH_HOTWIRE_LEFT~","~INPUT_VEH_DUCK~","~INPUT_MP_TEXT_CHAT_TEAM~","~INPUT_HUD_SPECIAL~"})end;a('ButtonNotification',K)b('ButtonNotification')c(0,false,true,-1)end;ButtonFor=function(K,L)local M=GetGameTimer()Citizen.CreateThread(function()while GetGameTimer()-M<(L or 5000)do ButtonNotification(K)Citizen.Wait(1)end end)end;FloatingNotification=function(K,N)a('FloatingNotification',K)SetFloatingHelpTextWorldPosition(1,N)SetFloatingHelpTextStyle(1,1,2,-1,3,0)b('FloatingNotification')c(2,false,false,-1)end;MakeEntityFaceEntity=function(O,P,Q)local R=g(O,true)local S=g(P,true)if Q then local T=GetHeadingFromVector_2d(S.x-R.x,S.y-R.y)SetEntityHeading(O,T)else local T=GetHeadingFromVector_2d(R.x-S.x,R.y-S.y)SetEntityHeading(P,T)end end;DrawText3Ds=function(N,U,V,W,X)if N then local Y,Z,_=h(N.x,N.y,N.z)if Y then i(V or 0.35,V or 0.35)j(W or 4)k("STRING")l(1)m(U)o(Z,_)if X then local a0=string.len(U)/370;local a1,a2=string.gsub(a0,"\n","\n")*0.025;if a2==nil then a2=0 end;DrawRect(Z,_+0.0125,0.025+a0,0.025+a2,0,0,0,90)end end end end;_G.old_TaskPlayAnim=TaskPlayAnim;TaskPlayAnim=function(z,a3,...)if not HasAnimDictLoaded(a3)then RequestAnimDict(a3)while not HasAnimDictLoaded(a3)do Citizen.Wait(1)end end;old_TaskPlayAnim(z,a3,...)RemoveAnimDict(a3)end;TaskEasyPlayAnim=function(a4,a5,a6,a7)if a6==nil then a6=51 end;if a7==nil then a7=-1 end;TaskPlayAnim(PlayerPedId(),a4,a5,2.0,2.0,a7,a6,0)if a7>-1 or a7>0 then Citizen.Wait(a7)end end;_G.old_CreateObject=CreateObject;CreateObject=function(a8,...)if type(a8)=="string"then a8=GetHashKey(a8)end;if not HasModelLoaded(a8)then RequestModel(a8)while not HasModelLoaded(a8)do Citizen.Wait(1)end end;local a9=old_CreateObject(a8,...)SetModelAsNoLongerNeeded(a8)local aa=0;if NetworkGetEntityIsNetworked(a9)then aa=ObjToNet(a9)SetNetworkIdExistsOnAllMachines(aa,true)SetNetworkIdCanMigrate(aa,true)end;return a9,aa end;_G.old_CreatePed=CreatePed;CreatePed=function(a8,...)if type(a8)=="string"then a8=GetHashKey(a8)end;if not HasModelLoaded(a8)then RequestModel(a8)while not HasModelLoaded(a8)do Citizen.Wait(1)end end;local z=old_CreatePed(0,a8,...)SetModelAsNoLongerNeeded(a8)local aa=0;if NetworkGetEntityIsNetworked(z)then aa=PedToNet(z)SetNetworkIdExistsOnAllMachines(aa,true)SetNetworkIdCanMigrate(aa,true)end;return z,aa end;SetPedStatic=function(ab,ac)FreezeEntityPosition(ab,ac)SetEntityInvincible(ab,ac)SetBlockingOfNonTemporaryEvents(ab,ac)end;_G.old_CreateVehicle=CreateVehicle;CreateVehicle=function(a8,...)if type(a8)=="string"then a8=GetHashKey(a8)end;if not HasModelLoaded(a8)then RequestModel(a8)while not HasModelLoaded(a8)do Citizen.Wait(1)end end;local ad=old_CreateVehicle(a8,...)SetModelAsNoLongerNeeded(a8)local aa=0;if NetworkGetEntityIsNetworked(ad)then aa=VehToNet(ad)SetNetworkIdExistsOnAllMachines(aa,true)SetNetworkIdCanMigrate(aa,true)end;return ad,aa end;_G.old_DeleteEntity=DeleteEntity;DeleteEntity=function(ab,ae)if not ae then NetworkRequestControlOfEntity(ab)while not NetworkRequestControlOfEntity(ab)do Citizen.Wait(1)end;if not IsEntityAMissionEntity(ab)then SetEntityAsMissionEntity(ab)end;old_DeleteEntity(ab)else NetworkRequestControlOfNetworkId(ab)local af=NetworkGetEntityFromNetworkId(ab)while not NetworkRequestControlOfEntity(af)do Citizen.Wait(1)end;SetEntityAsMissionEntity(af)old_DeleteEntity(af)end end;_G.old_RegisterNetEvent=RegisterNetEvent;RegisterNetEvent=function(ag,ah)old_RegisterNetEvent(ag)AddEventHandler(ag,ah)end;_G.old_GetPlayerName=GetPlayerName;GetPlayerName=function(ai)return old_GetPlayerName(ai or PlayerId())end;_G.old_PlayerPedId=PlayerPedId;PlayerPedId=function()if not p(Utility.Cache.PlayerPedId)then Utility.Cache.PlayerPedId=old_PlayerPedId()end;return Utility.Cache.PlayerPedId end;StopLoop=function(ai)Utility.Cache.Loop[ai].status=false end;CreateLoop=function(J,aj,ak)local al=RandomId(5)Utility.Cache.Loop[al]={status=true,func=J,tick=aj}if ak~=false then Citizen.CreateThread(function()while Utility.Cache.Loop[al]and Utility.Cache.Loop[al].status do J(al)Citizen.Wait(aj or 1)end end)end;return al end;PauseLoop=function(al,am)Citizen.SetTimeout(am or 0,function()print("Pausing loop "..al)Utility.Cache.Loop[al].status=false end)end;ResumeLoop=function(al,am)local an=Utility.Cache.Loop[al]Citizen.SetTimeout(am or 0,function()print("Resuming loop "..al)an.status=true;Citizen.CreateThread(function()while an and an.status do an.func(al)Citizen.Wait(an.tick or 1)end end)end)end;GetWorldClosestPed=function(ao)local ap=0;local aq=GetGamePool("CPed")local N=g(PlayerPedId())local ar=ao+5.0;for as=1,#aq do local at=q(N,g(aq[as]),false)if at<=ao and aq[as]~=PlayerPedId()then if ar>at then ar=at;ap=aq[as]end end end;return ap,aq end;GetWorldClosestPlayer=function(ao)local ap=0;local au={}local ar=ao+5.0;local aq=GetGamePool("CPed")local N=g(PlayerPedId())for as=1,#aq do if IsPedAPlayer(aq[as])then table.insert(au,NetworkGetPlayerIndexFromPed(aq[as]))local at=q(N,g(aq[as]),false)if at<=ao and aq[as]~=PlayerPedId()then if ar>at then ar=at;ap=NetworkGetPlayerIndexFromPed(aq[as])end end end end;return ap,au end;GetEntitySurfaceMaterial=function(ab)local N=GetEntityCoords(ab)local av=StartShapeTestCapsule(N.x,N.y,N.z,N.x,N.y,N.z-2.5,2,1,ab,7)local a1,aw,a1,a1,ax=GetShapeTestResultIncludingMaterial(av)return ax,aw end;GetLoadoutOfPed=function(z)local ay=ESX.GetWeaponList()local az={}for as=1,#ay,1 do local hash=GetHashKey(ay.name)if HasPedGotWeapon(z,hash,false)then table.insert(az,{name=ay.name,hash=hash,ammo=GetAmmoInPedWeapon(z,hash)})end end;return az end;local aA=FreezeEntityPosition;FreezeEntityPosition=function(ab,ac)Utility.Cache.Frozen[ab]=ac;aA(ab,ac)end;IsEntityFrozen=function(ab)return Utility.Cache.Frozen[ab]==true end;GetNearestValue=function(aB,aC)local aD=100*100000000000;local aE=0;for as=1,#aC do local aF=math.abs(aC[as]-aB)if aF<aD then aD=aF;n=aC[as]aE=as end end;return n,aD,aE end;TriggerSyncedEvent=function(y,aG,...)if type(aG)=="number"or type(aG)=="table"then if aG==-1 then t("Utility:SyncEvent",y,"",...)else t("Utility:SyncEvent",y,aG,...)end else developer("^1Error^0","you can use only number/table on whitelist of TriggerSyncedEvent","")end end;StartESX=function(ag,aH)Citizen.CreateThreadNow(function()while ESX==nil do TriggerEvent(ag or'esx:getSharedObject',function(a9)ESX=a9 end)Citizen.Wait(1)end;while ESX.GetPlayerData().job==nil do Citizen.Wait(1)end;xPlayer=ESX.GetPlayerData()if aH~=nil then while ESX.GetPlayerData()[aH]==nil do Citizen.Wait(1)end;xPlayer=ESX.GetPlayerData()end;if aH~=nil then RegisterNetEvent('esx:set'..string.upper(aH:sub(1,1))..aH:sub(2),function(aI)xPlayer[aH]=aI end)end;RegisterNetEvent('esx:setJob',function(aI)xPlayer.job=aI end)end)end;StartQB=function(aJ)QBCore=exports['qb-core']:GetCoreObject()end;GetDataForJob=function(aI)local aK=promise:new()if GetResourceState("es_extended")=="started"then ESX.TriggerServerCallback("Utility:GetJobData",function(aL)aK:resolve(aL)end,aI)elseif GetResourceState("qb-core")=="started"then QBCore.Functions.TriggerCallback("Utility:GetJobData",function(aL)aK:resolve(aL)end,aI)end;aK=Citizen.Await(aK)return#aK,aK end;local aM=0;GetOnHandObject=function()return aM end;TakeObjectOnHand=function(z,aN,aO,aP,aQ,aR,aS,aT,aU)developer("^2Taking^0","object",aN.." ("..GetEntityModel(aN)..")")if type(aN)=="number"then TaskPlayAnim(z,"anim@heists@box_carry@","idle",3.0,3.0,-1,63,0,0,0,0)Citizen.Wait(100)AttachEntityToEntity(aN,z,GetPedBoneIndex(z,60309),aP or 0.2,aQ or 0.08,aR or 0.2,aS or-45.0,aT or 290.0,aU or 0.0,true,true,false,true,1,true)aM=aN elseif type(aN)=="string"then local N=g(z)local aV=CreateObject(aN,N+vector3(0.0,0.0,aO or 0.2),true,false,false)SetEntityAsMissionEntity(aV)TaskPlayAnim(z,"anim@heists@box_carry@","idle",3.0,-8,-1,63,0,0,0,0)Citizen.Wait(100)AttachEntityToEntity(aV,z,GetPedBoneIndex(z,60309),aP or 0.2,aQ or 0.08,aR or 0.2,aS or-45.0,aT or 290.0,aU or 0.0,true,true,false,true,1,true)aM=aV;return aV end end;DropObjectFromHand=function(aW,aX)if aX then developer("^1Deleting^0","from hand",aW)DeleteEntity(aW)else developer("^3Dont delete^0","from hand",aW)DetachEntity(aW)SetEntityCoords(aW,GetOffsetFromEntityInWorldCoords(aW,0,0.5,0))PlaceObjectOnGroundProperly(aW)FreezeEntityPosition(aW,true)end;ClearPedTasks(PlayerPedId())aM=0 end;IsInRadius=function(R,S,ao,aY)local at=#(R-S)if aY then DrawSphere(S,ao,255,0,0,0.5)end;return at<ao end;IsNearCoords=function(N,ao,aY)local at=#(GetEntityCoords(PlayerPedId())-N)if aY then DrawSphere(N,ao,255,0,0,0.5)end;return at<ao end;GenerateRandomCoords=function(N,ao,T)local aZ=N.x+math.random(-ao,ao)local a_=N.y+math.random(-ao,ao)local a1,b0=GetGroundZFor_3dCoord(aZ,a_,200.0,0)if T then return vector3(aZ,a_,b0),math.random(0.0,360.0)end;return vector3(aZ,a_,b0)end;SetFor=function(ai,b1,b2)if Utility.Cache["SetData"][ai]==nil then Utility.Cache["SetData"][ai]={}end;if type(b1)=="table"then for b3,aB in pairs(b1)do developer("^2Setting^0","data","("..ai..") ["..b3 .." = "..json.encode(aB).."] {table}")Utility.Cache["SetData"][ai][b3]=aB end else developer("^2Setting^0","data","("..ai..") ["..b1 .." = "..json.encode(b2).."] {single}")Utility.Cache["SetData"][ai][b1]=b2 end end;GetFrom=function(ai,b1)if b1==nil then b1="not defined"end;developer("^3Getting^0","data","("..ai..") ["..b1 .."]")if Utility.Cache["SetData"][ai]~=nil then if b1=="not defined"then return Utility.Cache["SetData"][ai]else return Utility.Cache["SetData"][ai][b1]end else return nil end end;function GetSliceCoordsFromCoords(b4)return vector2(math.floor((b4.x+8192)/100),math.floor((b4.y+8192)/100))end;function GetSliceFromCoords(b5)local b6=GetSliceCoordsFromCoords(b5)local ai=b6.x*math.pow(2,2)+b6.y;return ai end;function GetEntitySlice(z)return GetSliceFromCoords(GetEntityCoords(z))end;function GetPlayerSlice(b7)local z=GetPlayerPed(b7)return GetSliceFromCoords(GetEntityCoords(z))end;function GetSelfSlice()local z=PlayerPedId()return GetSliceFromCoords(GetEntityCoords(z))end;function IsOnScreen(N)local Y,Z,_=World3dToScreen2d(N.x,N.y,N.z)return Y end;function SliceUsed(b6)return Utility.Cache.SliceGroups[b6]or false end;function SetSliceUsed(b6,b2)Utility.Cache.SliceGroups[b6]=b2 end;RandomId=function(b8)b8=b8 or 5;local b9=""for as=1,b8 do b9=b9 .."9"end;return math.random(0,b9)end;CreateMarker=function(ai,N,ba,bb,bc)if DoesExist("m",ai)then Citizen.Wait(100)return else if type(N)~="vector3"then developer("^1Error^0","You can use only vector3 for coords!",ai)return end;ai=string.gsub(ai,"{r}",RandomId())developer("^2Created^0","Marker",ai)local bd={render_distance=ba,interaction_distance=bb,coords=N,slice=tostring(GetSliceFromCoords(N))}if type(bc)=="table"then if bc.rgb~=nil then bd.type=1;bd.rgb=bc.rgb elseif bc.text~=nil then bd.type=0;bd.text=bc.text else bd.type=1;bd.rgb={bc[1],bc[2],bc[3]}end;if bc.type~=nil and type(bc.type)=="number"then bd._type=bc.type end;if bc.direction~=nil and type(bc.direction)=="vector3"then bd._direction=bc.direction end;if bc.rotation~=nil and type(bc.rotation)=="vector3"then bd._rot=bc.rotation end;if bc.scale~=nil and type(bc.scale)=="vector3"then bd._scale=bc.scale end;if bc.alpha~=nil and type(bc.alpha)=="number"then bd.alpha=bc.alpha end;if bc.animation~=nil and type(bc.animation)=="boolean"then bd.anim=bc.animation end;if bc.job~=nil then bd.job=bc.job end;if bc.notify~=nil then local be=string.multigsub(bc.notify,{"{A}","{B}","{C}","{D}","{E}","{F}","{G}","{H}","{L}","{M}","{N}","{O}","{P}","{Q}","{R}","{S}","{T}","{U}","{V}","{W}","{X}","{Y}","{Z}"},{"~INPUT_VEH_FLY_YAW_LEFT~","~INPUT_SPECIAL_ABILITY_SECONDARY~","~INPUT_LOOK_BEHIND~","~INPUT_MOVE_LR~","~INPUT_CONTEXT~","~INPUT_ARREST~","~INPUT_DETONATE~","~INPUT_VEH_ROOF~","~INPUT_CELLPHONE_CAMERA_FOCUS_LOCK~","~INPUT_INTERACTION_MENU~","~INPUT_REPLAY_ENDPOINT~","~INPUT_FRONTEND_PAUSE~","~INPUT_FRONTEND_LB~","~INPUT_RELOAD~","~INPUT_MOVE_DOWN_ONLY~","~INPUT_MP_TEXT_CHAT_ALL~","~INPUT_REPLAY_SCREENSHOT~","~INPUT_NEXT_CAMERA~","~INPUT_MOVE_UP_ONLY~","~INPUT_VEH_HOTWIRE_LEFT~","~INPUT_VEH_DUCK~","~INPUT_MP_TEXT_CHAT_TEAM~","~INPUT_HUD_SPECIAL~"})bd.notify=be end elseif type(bc)=="string"then bd.type=0;bd.text=bc end;Utility.Cache.Marker[ai]=bd;s("Utility:Create","Marker",ai,bd)end end;SetMarker=function(ai,bf,I,b2)if type(b2)~=bf then developer("^1Error^0",I.." can be only a "..bf,"[Marker]")return end;if DoesExist("marker",ai)then Utility.Cache.Marker[ai][I]=b2;s("Utility:Edit","Marker",ai,I,b2)else developer("^1Error^0","Unable to edit the marker as it does not exist",ai)end end;SetMarkerType=function(ai,bf)SetMarker(ai,"number","_type",bf)end;SetMarkerDirection=function(ai,bg)SetMarker(ai,"vector3","_direction",bg)end;SetMarkerRotation=function(ai,bh)SetMarker(ai,"vector3","_rot",bh)end;SetMarkerScale=function(ai,V)SetMarker(ai,"vector3","_scale",V)end;SetMarkerColor=function(ai,bi)SetMarker(ai,"table","rgb",bi)end;SetMarkerCoords=function(ai,N)SetMarker(ai,"vector3","coords",N)end;SetMarkerRenderDistance=function(ai,ba)SetMarker(ai,"number","render_distance",ba)end;SetMarkerInteractionDistance=function(ai,bb)SetMarker(ai,"number","interaction_distance",bb)end;SetMarkerAlpha=function(ai,bj)SetMarker(ai,"number","alpha",bj)end;SetMarkerAnimation=function(ai,ac)SetMarker(ai,"boolean","anim",ac)end;SetMarkerDrawOnEntity=function(ai,ac)SetMarker(ai,"boolean","draw_entity",ac)end;Set3dText=function(ai,U)SetMarker(ai,"string","text",U)end;Set3dTextScale=function(ai,V)SetMarker(ai,"number","_scale",V)end;Set3dTextDrawRect=function(ai,ac)SetMarker(ai,"boolean","rect",ac)end;Set3dTextFont=function(ai,W)SetMarker(ai,"number","font",W)end;DeleteMarker=function(ai)if not DoesExist("m",ai)then Citizen.Wait(100)return else developer("^1Deleted^0","Marker",ai)Utility.Cache.Marker[ai]=nil;s("Utility:Remove","Marker",ai)end end;CreateiObject=function(ai,bk,b5,T,bb,bl,aI)developer("^2Created^0 Object "..ai.." ("..bk..")")local a9;if bl~=nil then a9=CreateObject(GetHashKey(bk),b5.x,b5.y,b5.z,bl,false,false)or nil else a9=CreateObject(GetHashKey(bk),b5.x,b5.y,b5.z,true,false,false)or nil end;SetEntityHeading(a9,T)SetEntityAsMissionEntity(a9,true,true)FreezeEntityPosition(a9,true)SetModelAsNoLongerNeeded(hash)_object={obj=a9,coords=b5,interaction_distance=bb or 3.0,slice=tostring(GetSliceFromCoords(b5)),job=aI}Utility.Cache.Object[ai]=_object;s("Utility:Create","Object",ai,_object)return a9,g(a9)end;DeleteiObject=function(ai,aX)developer("^1Deleted^0","Object",ai)if aX then DeleteEntity(Utility.Cache.Object[ai].obj)end;Utility.Cache.Object[ai]=nil;s("Utility:Remove","Object",ai)end;CreateBlip=function(bm,N,bn,bo,V)developer("^2Created^0","Blip",bm)local bp=AddBlipForCoord(N)SetBlipSprite(bp,bn)SetBlipScale(bp,V or 1.0)SetBlipColour(bp,bo)SetBlipAsShortRange(bp,true)BeginTextCommandSetBlipName('STRING')e(bm)EndTextCommandSetBlipName(bp)return bp end;CreateJobBlip=function(bm,N,aI,bn,bo,V)s("Utility:Create","Blips",math.random(10000,99999),{name=bm,coords=N,job=aI,sprite=bn,colour=bo,scale=V or 1.0})end;SetIdOf=function(type,ai,bq)if type:lower()=="marker"or type:lower()=="m"then type="Marker"elseif type:lower()=="object"or type:lower()=="o"then type="Object"else return nil end;if DoesExist(type,ai)then Utility.Cache[type][bq]=Utility.Cache[type][ai]Utility.Cache[type][ai]=nil else developer("^1Error^0","Unable to set id of the "..type.." as it does not exist",ai)return end;developer("^3Change^0","Setted id to "..bq.." of the id",ai)s("Utility:Remove",type,ai)s("Utility:Create",type,bq,Utility.Cache[type][bq])end;GetDistanceFrom=function(type,ai)if type:lower()=="marker"or type:lower()=="m"then type="Marker"elseif type:lower()=="object"or type:lower()=="o"then type="Object"else return nil end;local at=0.0;if Utility.Cache[type][ai].coords~=nil then return q(g(PlayerPedId()),Utility.Cache[type][ai].coords,true)else return false end end;GetCoordOf=function(type,ai)if type:lower()=="marker"or type:lower()=="m"then type="Marker"elseif type:lower()=="object"or type:lower()=="o"then type="Object"else return nil end;if DoesExist(type,ai)then return Utility.Cache[type][ai].coords else developer("^1Error^0","Unable to get the coords of the id",ai)return false end end;DoesExist=function(type,ai)if type:lower()=="marker"or type:lower()=="m"then type="Marker"elseif type:lower()=="object"or type:lower()=="o"then type="Object"else return nil end;if Utility.Cache[type][ai]~=nil then return true else return false end end;CreateCamera=function(N,br,ac,bs)local bt=CreateCam("DEFAULT_SCRIPTED_CAMERA",true)SetCamCoord(bt,N)if br~=nil then SetCamRot(bt,br.x,br.y,br.z)end;if bs~=nil then ShakeCam(bt,bs.type or"",bs.amount or 0.0)end;if ac then SetCamActive(bt,true)RenderScriptCams(1,1,1500)end;return bt end;SwitchBetweenCam=function(bu,bt,a7)SetCamActiveWithInterp(bt,bu,a7 or 1500,1,1)Citizen.Wait(a7 or 1500)DestroyCam(bu)end;DevMode=function(bv,bw,bx)if bw==nil then bw=true end;bx=bx or"%s %s %s"if bv then developer=function(by,type,ai)local a1,a1,a1,bz,bA,bB=GetLocalTime()if bw then if type==nil then print(bz..":"..bA..":"..bB.." - "..by)else print(bz..":"..bA..":"..bB.." - "..string.format(bx,by,type,ai))end else if type==nil then print(by)else print(string.format(bx,by,type,ai))end end end else developer=function()end end end;ReplaceTexture=function(aV,bC,bD,bE,bF)local bG=CreateRuntimeTxd('duiTxd')local bH=CreateDui(bD,bE,bF)local bI=GetDuiHandle(bH)local bJ=CreateRuntimeTextureFromDuiHandle(bG,'duiTex',bI)AddReplaceTexture(aV,bC,'duiTxd','duiTex')end;printd=function(bK,bL)if bL then local bM={}local function bN(bO,bP)if bM[tostring(bO)]then print(bP.."*"..tostring(bO))else bM[tostring(bO)]=true;if type(bO)=="table"then for b5,bQ in pairs(bO)do if type(bQ)=="table"then print(bP.."["..b5 .."] => "..tostring(bO).." {")bN(bQ,bP..string.rep(" ",string.len(b5)+8))print(bP..string.rep(" ",string.len(b5)+6).."}")elseif type(bQ)=="string"then print(bP.."["..b5 .."] => \""..bQ.."\"")else print(bP.."["..b5 .."] => "..tostring(bQ))end end else print(bP..tostring(bO))end end end;if type(bK)=="table"then print(tostring(bK).." {")bN(bK,"  ")print("}")else developer("^1Error^0","error dumping table "..bK.." why isnt a table","")end else if type(bK)=="table"then print(json.encode(bK,{indent=true}))else developer("^1Error^0","error dumping table "..bK.." why isnt a table","")end end end;local bR=string.gsub;string.multigsub=function(string,table,bS)if type(table)then for as=1,#table do string=bR(string,table[as],bS[as])end else for as=1,#table do string=bR(string,table[as],bS)end end;return string end;table.fexist=function(bK,bT)bK=bK[bT]if not bK then return false else return true end end;local bU=table.remove;table.remove=function(bK,bV,bW)if type(bV)=="number"then bU(bK,bV)elseif type(bV)=="string"then for b3,aB in pairs(bK)do if b3==bV then bK[b3]=nil;if bW then break end end end end end;table.empty=function(bK)return next(bK)==nil end;table.clone=function(bK)bK.metatable={__index=bK}local bX={}setmetatable(bX,bK.metatable)return bX end;local function bY(ab,_dialog,bZ)return{Question=function(...)local b_={...}_dialog.questions=b_;return{Response=function(...)local c0={}local c1={}for c2,c3 in pairs({...})do c1[c2]={}for b3,aB in pairs(c3)do if c0[c2]==nil then c0[c2]=""end;c0[c2]=c0[c2]..b3 .."~w~ "..aB.." | "b3=string.multigsub(b3,{"%[","%]"},{"",""})b3=string.multigsub(b3,{"~r~","~b~","~g~","~y~","~p~","~o~","~c~","~m~","~u~","~n~","~s~","~w~"},{"","","","","","","","","","","",""})c1[c2][b3]=aB end;c0[c2]=c0[c2]:sub(1,-3)end;_dialog.response={no_formatted=c1,formatted=c0}if bZ then s("Utility:Remove","Dialogue",ab)s("Utility:Create","Dialogue",ab,_dialog)else s("Utility:Create","Dialogue",ab,_dialog)end;Utility.Cache.Dialogue[ab]=_dialog;return{LastQuestion=function(c4)Utility.Cache.Dialogue[ab].lastq=c4;s("Utility:Edit","Dialogue",ab,"lastq",c4)end}end}end}end;StartDialogue=function(ab,at,c5)local _dialog={}_dialog={entity=ab,distance=at,current_question=1,callback=c5,slice=tostring(GetEntitySlice(ab))}developer("^2Created^0","dialogue with entity",ab)return bY(ab,_dialog)end;EditDialogue=function(ab)if ab~=nil and IsEntityOnDialogue(ab)then return bY(ab,_dialog,true)end end;StopDialogue=function(ab)if ab~=nil and IsEntityOnDialogue(ab)then developer("^1Stopping^0","dialogue",ab)if Utility.Cache.Dialogue[ab].lastq~=nil then local c6=0;local c7=Utility.Cache.Dialogue[ab].lastq;local c8=Utility.Cache.Dialogue[ab].entity;local c9=GetEntityCoords(c8)+vector3(0.0,0.0,1.0)local ca=false;Citizen.SetTimeout(3000,function()c9=nil;ca=true end)CreateLoop(function(al)c9=GetEntityCoords(_entity)+vector3(0.0,0.0,1.0)if ca then c9=nil;StopLoop(al)end;DrawText3Ds(c9,c7,nil,nil,true)end)end;Utility.Cache.Dialogue[ab]=nil;s("Utility:Remove","Dialogue",ab)end end;RegisterNetEvent("Utility_Native:ResyncDialogue",function(ab)Utility.Cache.Dialogue[ab]=nil end)IsEntityOnDialogue=function(ab)return Utility.Cache.Dialogue[ab]end;local function cb(table)local cc={}print("Copying table "..tostring(table))for b3,aB in pairs(table)do cc[b3]=aB end;return cc end;CreateLoop(function()for bm,cd in pairs(Utility.Cache.FlowDetector)do local ce=_G[bm]if type(ce)=='table'or type(cd)=='table'then if json.encode(cd)~=json.encode(ce)then print("\nDetected old_value change of syncedV \""..bm.."\" from \""..json.encode(cd).."\" to \""..json.encode(ce).."\"")TriggerSyncedEvent("Utility:SyncValue_emit",-1,bm,cd,ce)TriggerSyncedEvent("Utility:SyncValue["..u.."]",-1,bm,ce)local cc=cb(ce)Utility.Cache.FlowDetector[bm]=cc end else if ce~=cd then TriggerSyncedEvent("Utility:SyncValue_emit",-1,bm,cd,ce)TriggerSyncedEvent("Utility:SyncValue["..u.."]",-1,bm,ce)Utility.Cache.FlowDetector[bm]=ce end end end end,2000)Synced=function(bm,b2)print("Creating synceV "..bm)if type(b2)=="table"then local cc=cb(b2)Utility.Cache.FlowDetector[bm]=cc;_G[bm]=b2 else Utility.Cache.FlowDetector[bm]=b2;_G[bm]=b2 end end;RegisterNetEvent("Utility:SyncValue["..u.."]",function(bm,b2)_G[bm]=b2 end)local function cf(cg,ch)local ci=RequestScaleformMovie(ch)local c6=100;while not HasScaleformMovieLoaded(ci)and c6>0 do c6=c6-1;ci=RequestScaleformMovie(ch)Citizen.Wait(5)end;if c6==0 then developer("^1Error^0","After 100 attempts to load the scaleform the scaleform has not loaded yet, try again or check that it has started correctly!","")return end;Utility.Cache.N3d[cg].scaleform=ci;s("Utility:Edit","N3d",cg,"scaleform",ci)end;local function cj(cg,bD,bE,bF)local bG=CreateRuntimeTxd('txd')Utility.Cache.N3d[cg].dui=CreateDui(bD,bE,bF)s("Utility:Edit","N3d",cg,"dui",Utility.Cache.N3d[cg].dui)local bI=GetDuiHandle(Utility.Cache.N3d[cg].dui)CreateRuntimeTextureFromDuiHandle(bG,'txn',bI)if Utility.Cache.N3d[cg].scaleform~=nil and not Utility.Cache.N3d[cg].txd then PushScaleformMovieFunction(Utility.Cache.N3d[cg].scaleform,'SET_TEXTURE')PushScaleformMovieMethodParameterString('txd')PushScaleformMovieMethodParameterString('txn')PushScaleformMovieFunctionParameterInt(0)PushScaleformMovieFunctionParameterInt(0)PushScaleformMovieFunctionParameterInt(bE)PushScaleformMovieFunctionParameterInt(bF)PopScaleformMovieFunctionVoid()Utility.Cache.N3d[cg].txd=true;s("Utility:Edit","N3d",cg,"txd",true)end end;function CreateNui3d(ck,bD)local cg=tostring(math.random(0,9999))local cl={txd=false,show=false,rotation={}}Utility.Cache.N3d[cg]=cl;s("Utility:Create","N3d",cg,cl)cf(cg,ck)if bD~=nil then cj(cg,"nui://"..GetCurrentResourceName().."/"..bD,1920,1080)end;local cm={}cm.__index=cm;cm.init=function(self,bD,bE,bF)cj(cg,"nui://"..GetCurrentResourceName().."/"..bD,bE or 1920,bF or 1080)end;cm.scale=function(self,V)Utility.Cache.N3d[cg].advanced_scale=V;s("Utility:Edit","N3d",cg,"advanced_scale",V)end;cm.rotation=function(self,br,cn)Utility.Cache.N3d[cg].rotation.rotation=br;Utility.Cache.N3d[cg].rotation.syncedwithplayer=cn;s("Utility:Edit","N3d",cg,"rotation",{rotation=br,syncedwithplayer=cn})end;cm.destroy=function(self)if Utility.Cache.N3d[cg].dui~=nil then DestroyDui(Utility.Cache.N3d[cg].dui)SetScaleformMovieAsNoLongerNeeded(ck)s("Utility:Remove","N3d",cg)end end;cm.started=function()return Utility.Cache.N3d[cg].dui~=nil end;cm.show=function(self,N,V)Utility.Cache.N3d[cg].coords=N;Utility.Cache.N3d[cg].scale=V or 0.1;Utility.Cache.N3d[cg].show=true;s("Utility:Edit","N3d",cg,"coords",N)s("Utility:Edit","N3d",cg,"scale",V or 0.1)s("Utility:Edit","N3d",cg,"show",true)end;cm.visible=function()return Utility.Cache.N3d[cg].show end;cm.hide=function()Utility.Cache.N3d[cg].show=false;s("Utility:Edit","N3d",cg,"show",false)end;cm.attach=function(self,ab,co)Utility.Cache.N3d[cg].attach={entity=ab,offset=co or vector3(0.0,0.0,0.0)}s("Utility:Edit","N3d",cg,"attach",{entity=ab,offset=co or vector3(0.0,0.0,0.0)})end;cm.detach=function(self,cp)if cp then Utility.Cache.N3d[cg].coords=GetEntityCoords(Utility.Cache.N3d[cg].attach.entity)s("Utility:Edit","N3d",cg,"coords",Utility.Cache.N3d[cg].coords)end;Utility.Cache.N3d[cg].attach=nil;s("Utility:Edit","N3d",cg,"attach",nil)end;cm.object=function()return Utility.Cache.N3d[cg].dui end;cm.msg=function(self,K)if self:started()then SendDuiMessage(self:object(),json.encode(K))end end;return setmetatable({},cm)end;AddEventHandler("onResourceStop",function(cq)if cq==u then for as=1,#Utility.Cache.Events do RemoveEventHandler(Utility.Cache.Events[as])end;for cr,cs in pairs(Utility.Cache.N3d)do if cs.dui~=nil then DestroyDui(cs.dui)s("Utility:Remove","N3d",cr)end end end end)GetDirectionFromVectors=function(ct,cu)return ct-cu end;RotationToDirection=function(br)local cv={x=math.pi/180*br.x,y=math.pi/180*br.y,z=math.pi/180*br.z}local bg={x=-math.sin(cv.z)*math.abs(math.cos(cv.x)),y=math.cos(cv.z)*math.abs(math.cos(cv.x)),z=math.sin(cv.x)}return vector3(bg.x,bg.y,bg.z)end;TranslateZAnimated=function(a9,b0,cw)local N=GetEntityCoords(a9)local cx=b0<0;for as=1,math.abs(b0)*100 do local cy=cx and N.z-as/100 or N.z+as/100;SetEntityCoords(a9,N.x,N.y,cy)Citizen.Wait(cw)end end;SetVehicleWheelsPowered=function(ad,ac)for as=0,GetVehicleNumberOfWheels(ad)-1 do SetVehicleWheelIsPowered(ad,as,ac)end end;CreateInteraction=function(ai,N,cz,ba,bb)developer("^2Created^0","Interaction",ai)exports["utility_interaction"]:CreateInteraction(ai,N,cz,ba,bb)end;DeleteInteraction=function(ai)developer("^1Deleted^0","Interaction",ai)exports["utility_interaction"]:DeleteInteraction(ai)end;ShowUtilityNotification=function(cA,cB,cC,cD,a7)exports["utility_notify"]:show(cA,cB,cC,cD,a7)end;CreateMissionText=function(K,a7)SetTextEntry_2("STRING")AddTextComponentString(K)DrawSubtitleTimed(a7 and math.floor(a7)or 60000*240,1)return{delete=function()ClearPrints()end}end;WaitNear=function(N)local b7=PlayerPedId()while#(GetEntityCoords(b7)-N)>10 do Citizen.Wait(100)end end;apairs=function(bO,cE)local c6={}local as=0;for b3 in pairs(bO)do table.insert(c6,b3)end;table.sort(c6,cE)local cF=function()as=as+1;if c6[as]==nil then return nil else return c6[as],bO[c6[as]]end end;return cF end;FindInTable=function(table,U)for as=1,#table do if table[as]==U then return as end end;return nil end;GetRandom=function(table)local cG=math.random(1,#table)return table[cG]end;Probability=function(cH)return math.random()+math.random(0,99)<=cH end;AddPercentage=function(cH,cI)return cH+cH*cI/100 end;RemovePercentage=function(cH,cI)return cH-cH*cI/100 end