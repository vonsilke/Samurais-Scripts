---@diagnostic disable: undefined-global, lowercase-global, undefined-field

SCRIPT_VERSION = '1.3.1' -- v1.3.1
TARGET_BUILD   = '3323'
TARGET_VERSION = '1.69'
log.info("version " .. SCRIPT_VERSION)


require('lib/samurais_utils')


CURRENT_BUILD   = Game.GetBuildNumber()
CURRENT_VERSION = Game.GetOnlineVersion()


Samurais_scripts       = gui.add_tab("Samurai's Scripts")
loading_label          = ""
start_loading_anim     = false
default_config         = {
  shortcut_anim           = {},
  saved_vehicles          = {},
  persist_attachments     = {},
  favorite_actions        = {},
  driftSmoke_T            = {
    r = 255,
    g = 255,
    b = 255,
  },
  vmine_type              = { spikes = false, slick = false, explosive = false, emp = false, kinetic = false },
  whouse_1_size           = { small = false, medium = false, large = false },
  whouse_2_size           = { small = false, medium = false, large = false },
  whouse_3_size           = { small = false, medium = false, large = false },
  whouse_4_size           = { small = false, medium = false, large = false },
  whouse_5_size           = { small = false, medium = false, large = false },
  keybinds                = {
    rodBtn        = { code = 0x58, name = "[X]" },
    tdBtn         = { code = 0x10, name = "[Shift]" },
    nosBtn        = { code = 0x10, name = "[Shift]" },
    stop_anim     = { code = 0x47, name = "[G]" },
    play_anim     = { code = 0x2E, name = "[DEL]" },
    previous_anim = { code = 0x21, name = "[PAGE UP]" },
    next_anim     = { code = 0x22, name = "[PAGE DOWN]" },
    flatbedBtn    = { code = 0x58, name = "[X]" },
    purgeBtn      = { code = 0x58, name = "[X]" },
    autokill      = { code = 0x76, name = "[F7]" },
    enemiesFlee   = { code = 0x77, name = "[F8]" },
    vehicle_mine  = { code = 0x4E, name = "[N]" },
    triggerbotBtn = { code = 0x10, name = "[Shift]" },
    panik         = { code = 0x8,  name = "[BACKSPACE]" },
  },
  gpad_keybinds           = {
    rodBtn        = { code = 0, name = "[Unbound]" },
    tdBtn         = { code = 0, name = "[Unbound]" },
    nosBtn        = { code = 0, name = "[Unbound]" },
    flatbedBtn    = { code = 0, name = "[Unbound]" },
    purgeBtn      = { code = 0, name = "[Unbound]" },
    vehicle_mine  = { code = 0, name = "[Unbound]" },
    triggerbotBtn = { code = 0, name = "[Unbound]" },
  },
  Regen                   = false,
  -- objectiveTP             = false,
  disableTooltips         = false,
  phoneAnim               = false,
  disableProps            = false,
  sprintInside            = false,
  lockpick                = false,
  rod                     = false,
  clumsy                  = false,
  ragdoll_sound           = false,
  hideFromCops            = false,
  manualFlags             = false,
  controllable            = false,
  looped                  = false,
  upperbody               = false,
  freeze                  = false,
  usePlayKey              = false,
  replaceSneakAnim        = false,
  replacePointAct         = false,
  disableActionMode       = false,
  disableSound            = false,
  npc_godMode             = false,
  Triggerbot              = false,
  aimEnemy                = false,
  autoKill                = false,
  runaway                 = false,
  laserSight              = false,
  disableUiSounds         = false,
  driftMode               = false,
  DriftTires              = false,
  DriftSmoke              = false,
  BurnoutSmoke            = false,
  customSmokeCol          = false,
  driftMinigame           = false,
  speedBoost              = false,
  nosvfx                  = false,
  nosAudio                = false,
  nosFlames               = false,
  hornLight               = false,
  nosPurge                = false,
  insta180                = false,
  flappyDoors             = false,
  rgbLights               = false,
  loud_radio              = false,
  launchCtrl              = false,
  popsNbangs              = false,
  limitVehOptions         = false,
  missiledefense          = false,
  louderPops              = false,
  autobrklight            = false,
  holdF                   = false,
  keepWheelsTurned        = false,
  noJacking               = false,
  veh_mines               = false,
  towEverything           = false,
  noEngineBraking         = false,
  kersBoost               = false,
  offroaderx2             = false,
  rallyTires              = false,
  noTractionCtrl          = false,
  easyWheelie             = false,
  rwSteering              = false,
  awSteering              = false,
  handbrakeSteering       = false,
  useGameLang             = false,
  bypass_casino_bans      = false,
  force_poker_cards       = false,
  set_dealers_poker_cards = false,
  force_roulette_wheel    = false,
  rig_slot_machine        = false,
  autoplay_slots          = false,
  autoplay_cap            = false,
  heist_cart_autograb     = false,
  flares_forall           = false,
  unbreakableWindows      = false,
  real_plane_speed        = false,
  extend_world            = false,
  disableFlightMusic      = false,
  disable_quotes          = false,
  disable_mdef_logs       = false,
  replace_pool_q          = false,
  public_seats            = false,
  mc_work_cd              = false,
  hangar_cd               = false,
  nc_management_cd        = false,
  nc_vip_mission_chance   = false,
  security_missions_cd    = false,
  ie_vehicle_steal_cd     = false,
  ie_vehicle_sell_cd      = false,
  ceo_crate_buy_cd        = false,
  ceo_crate_sell_cd       = false,
  ceo_crate_buy_f_cd      = false,
  ceo_crate_sell_f_cd     = false,
  cashUpdgrade1           = false,
  cashUpdgrade2           = false,
  cokeUpdgrade1           = false,
  cokeUpdgrade2           = false,
  methUpdgrade1           = false,
  methUpdgrade2           = false,
  weedUpdgrade1           = false,
  weedUpdgrade2           = false,
  fdUpdgrade1             = false,
  fdUpdgrade2             = false,
  bunkerUpdgrade1         = false,
  bunkerUpdgrade2         = false,
  acidUpdgrade            = false,
  whouse_1_owned          = false,
  whouse_2_owned          = false,
  whouse_3_owned          = false,
  whouse_4_owned          = false,
  whouse_5_owned          = false,
  nosBtn                  = 21,
  nosPower                = 10,
  lightSpeed              = 1,
  DriftPowerIncrease      = 1,
  driftPB                 = 0,
  driftSmokeIndex         = 0,
  laser_switch            = 0,
  lang_idx                = 0,
  DriftIntensity          = 0,
  autoplay_chips_cap      = 0,
  supply_autofill_delay   = 500,
  laser_choice            = "proj_laser_enemy",
  LANG                    = 'en-US',
  current_lang            = 'English',
}

LANG                   = lua_cfg.read("LANG")
current_lang           = lua_cfg.read("current_lang")
keybinds               = lua_cfg.read("keybinds")
gpad_keybinds          = lua_cfg.read("gpad_keybinds")
Regen                  = lua_cfg.read("Regen")
-- objectiveTP              = lua_cfg.read("objectiveTP")
phoneAnim              = lua_cfg.read("phoneAnim")
sprintInside           = lua_cfg.read("sprintInside")
lockPick               = lua_cfg.read("lockPick")
replaceSneakAnim       = lua_cfg.read("replaceSneakAnim")
replacePointAct        = lua_cfg.read("replacePointAct")
disableActionMode      = lua_cfg.read("disableActionMode")
hideFromCops           = lua_cfg.read("hideFromCops")
favorite_actions       = lua_cfg.read("favorite_actions")
rod                    = lua_cfg.read("rod")
clumsy                 = lua_cfg.read("clumsy")
ragdoll_sound          = lua_cfg.read("ragdoll_sound")
manualFlags            = lua_cfg.read("manualFlags")
controllable           = lua_cfg.read("controllable")
looped                 = lua_cfg.read("looped")
upperbody              = lua_cfg.read("upperbody")
freeze                 = lua_cfg.read("freeze")
disableProps           = lua_cfg.read("disableProps")
npc_godMode            = lua_cfg.read("npc_godMode")
usePlayKey             = lua_cfg.read("usePlayKey")
shortcut_anim          = lua_cfg.read("shortcut_anim")
Triggerbot             = lua_cfg.read("Triggerbot")
aimEnemy               = lua_cfg.read("aimEnemy")
autoKill               = lua_cfg.read("autoKill")
runaway                = lua_cfg.read("runaway")
laserSight             = lua_cfg.read("laserSight")
laser_switch           = lua_cfg.read("laser_switch")
laser_choice           = lua_cfg.read("laser_choice")
driftMode              = lua_cfg.read("driftMode")
DriftIntensity         = lua_cfg.read("DriftIntensity")
DriftPowerIncrease     = lua_cfg.read("DriftPowerIncrease")
DriftTires             = lua_cfg.read("DriftTires")
driftSmokeIndex        = lua_cfg.read("driftSmokeIndex")
customSmokeCol         = lua_cfg.read("customSmokeCol")
driftSmoke_T           = lua_cfg.read("driftSmoke_T")
DriftSmoke             = lua_cfg.read("DriftSmoke")
BurnoutSmoke           = lua_cfg.read("BurnoutSmoke")
driftMinigame          = lua_cfg.read("driftMinigame")
driftPB                = lua_cfg.read("driftPB")
speedBoost             = lua_cfg.read("speedBoost")
nosvfx                 = lua_cfg.read("nosvfx")
hornLight              = lua_cfg.read("hornLight")
nosPurge               = lua_cfg.read("nosPurge")
nosPower               = lua_cfg.read("nosPower")
nosAudio               = lua_cfg.read("nosAudio")
nosBtn                 = lua_cfg.read("nosBtn")
nosFlames              = lua_cfg.read("nosFlames")
lightSpeed             = lua_cfg.read("lightSpeed")
loud_radio             = lua_cfg.read("loud_radio")
launchCtrl             = lua_cfg.read("launchCtrl")
popsNbangs             = lua_cfg.read("popsNbangs")
louderPops             = lua_cfg.read("louderPops")
limitVehOptions        = lua_cfg.read("limitVehOptions")
missiledefense         = lua_cfg.read("missiledefense")
autobrklight           = lua_cfg.read("autobrklight")
rgbLights              = lua_cfg.read("rgbLights")
holdF                  = lua_cfg.read("holdF")
keepWheelsTurned       = lua_cfg.read("keepWheelsTurned")
noJacking              = lua_cfg.read("noJacking")
insta180               = lua_cfg.read("insta180")
flares_forall          = lua_cfg.read("flares_forall")
real_plane_speed       = lua_cfg.read("real_plane_speed")
unbreakableWindows     = lua_cfg.read("unbreakableWindows")
veh_mines              = lua_cfg.read("veh_mines")
vmine_type             = lua_cfg.read("vmine_type")
towEverything          = lua_cfg.read("towEverything")
noEngineBraking        = lua_cfg.read("noEngineBraking")
kersBoost              = lua_cfg.read("kersBoost")
offroaderx2            = lua_cfg.read("offroaderx2")
rallyTires             = lua_cfg.read("rallyTires")
noTractionCtrl         = lua_cfg.read("noTractionCtrl")
easyWheelie            = lua_cfg.read("easyWheelie")
rwSteering             = lua_cfg.read("rwSteering")
awSteering             = lua_cfg.read("awSteering")
handbrakeSteering      = lua_cfg.read("handbrakeSteering")
extend_world           = lua_cfg.read("extend_world")
disableFlightMusic     = lua_cfg.read("disableFlightMusic")
disable_quotes         = lua_cfg.read("disable_quotes")
disable_mdef_logs      = lua_cfg.read("disable_mdef_logs")
replace_pool_q         = lua_cfg.read("replace_pool_q")
public_seats           = lua_cfg.read("public_seats")
mc_work_cd             = lua_cfg.read("mc_work_cd")
hangar_cd              = lua_cfg.read("hangar_cd")
nc_management_cd       = lua_cfg.read("nc_management_cd")
nc_vip_mission_chance  = lua_cfg.read("nc_vip_mission_chance")
security_missions_cd   = lua_cfg.read("security_missions_cd")
ie_vehicle_steal_cd    = lua_cfg.read("ie_vehicle_steal_cd")
ie_vehicle_sell_cd     = lua_cfg.read("ie_vehicle_sell_cd")
ceo_crate_buy_cd       = lua_cfg.read("ceo_crate_buy_cd")
ceo_crate_sell_cd      = lua_cfg.read("ceo_crate_sell_cd")
ceo_crate_buy_f_cd     = lua_cfg.read("ceo_crate_buy_f_cd")
ceo_crate_sell_f_cd    = lua_cfg.read("ceo_crate_sell_f_cd")
cashUpdgrade1          = lua_cfg.read("cashUpdgrade1")
cashUpdgrade2          = lua_cfg.read("cashUpdgrade2")
cokeUpdgrade1          = lua_cfg.read("cokeUpdgrade1")
cokeUpdgrade2          = lua_cfg.read("cokeUpdgrade2")
methUpdgrade1          = lua_cfg.read("methUpdgrade1")
methUpdgrade2          = lua_cfg.read("methUpdgrade2")
weedUpdgrade1          = lua_cfg.read("weedUpdgrade1")
weedUpdgrade2          = lua_cfg.read("weedUpdgrade2")
fdUpdgrade1            = lua_cfg.read("fdUpdgrade1")
fdUpdgrade2            = lua_cfg.read("fdUpdgrade2")
bunkerUpdgrade1        = lua_cfg.read("bunkerUpdgrade1")
bunkerUpdgrade2        = lua_cfg.read("bunkerUpdgrade2")
acidUpdgrade           = lua_cfg.read("acidUpdgrade")
whouse_1_owned         = lua_cfg.read("whouse_1_owned")
whouse_2_owned         = lua_cfg.read("whouse_2_owned")
whouse_3_owned         = lua_cfg.read("whouse_3_owned")
whouse_4_owned         = lua_cfg.read("whouse_4_owned")
whouse_5_owned         = lua_cfg.read("whouse_5_owned")
whouse_1_size          = lua_cfg.read("whouse_1_size")
whouse_2_size          = lua_cfg.read("whouse_2_size")
whouse_3_size          = lua_cfg.read("whouse_3_size")
whouse_4_size          = lua_cfg.read("whouse_4_size")
whouse_5_size          = lua_cfg.read("whouse_5_size")
supply_autofill_delay  = lua_cfg.read("supply_autofill_delay")
current_vehicle        = self.get_veh()
last_vehicle           = self.get_veh()
tab1Sound              = true
tab2Sound              = true
tab3Sound              = true
is_playing_anim        = false
is_shortcut_anim       = false
anim_music             = false
is_playing_scenario    = false
is_playing_radio       = false
aimBool                = false
HashGrabber            = false
drew_laser             = false
isCrouched             = false
is_handsUp             = false
phoneAnimsEnabled      = false
is_car                 = false
is_quad                = false
is_boat                = false
is_bike                = false
validModel             = false
has_xenon              = false
has_custom_tires       = false
custom_tires_checked   = false
tire_smoke_col_checked = false
tire_smoke             = false
drift_started          = false
purge_started          = false
nos_started            = false
twostep_started        = false
is_typing              = false
is_setting_hotkeys     = false
open_sounds_window     = false
started_lct            = false
launch_active          = false
started_popSound       = false
started_popSound2      = false
pedGrabber             = false
ped_grabbed            = false
vehicleGrabber         = false
vehicle_grabbed        = false
carpool                = false
show_npc_veh_ctrls     = false
stop_searching         = false
hijack_started         = false
sound_btn_off          = false
is_drifting            = false
start_rgb_loop         = false
ubwindowsToggled       = false
default_pops_disabled  = false
engine_brake_disabled  = false
traction_ctrl_disabled = false
kers_boost_enabled     = false
offroader_enabled      = false
rally_tires_enabled    = false
easy_wheelie_enabled   = false
-- rw_steering_enabled      = false --[[
-- aw_steering_enabled      = false -- they work but the steering is not rendered.
-- hb_steering_enabled      = false --]]
world_extended         = false
autopilot_waypoint     = false
autopilot_objective    = false
autopilot_random       = false
flight_music_off       = false
loud_radio_enabled     = false
q_replaced             = false
is_sitting             = false
is_hiding              = false
ducking_in_car         = false
hiding_in_boot         = false
hiding_in_dumpster     = false
SS_debug               = false
debug_counter          = 0
flag                   = 0
grp_anim_index         = 0
attached_ped           = 0
grabbed_veh            = 0
thisVeh                = 0
anim_index             = 0
scenario_index         = 0
recents_index          = 0
fav_actions_index      = 0
npc_index              = 0
actions_switch         = 0
Entity                 = 0
timerA                 = 0
timerB                 = 0
defaultXenon           = 0
vehSound_index         = 0
selected_smoke_col     = 0
pBus                   = 0
dummyDriver            = 0
dummyCopCar            = 0
sound_index1           = 0
sound_index2           = 0
sound_switch           = 0
radio_index            = 0
drift_points           = 0
drift_extra_pts        = 0
straight_counter       = 0
drift_time             = 0
loud_pops_event        = 0
katana                 = 0
boot_vehicle           = 0
thisDumpster           = 0
drift_multiplier       = 1
quote_alpha            = 1
pedthrowF              = 10
drift_streak_text      = ""
drift_extra_text       = ""
actions_search         = ""
currentMvmt            = ""
currentStrf            = ""
currentWmvmt           = ""
search_term            = ""
smokeHex               = ""
random_quote           = ""
filteredPlayers        = {}
recently_played_a      = {}
selected_sound         = {}
selected_radio         = {}
smokePtfx_t            = {}
nosptfx_t              = {}
purgePtfx_t            = {}
lctPtfx_t              = {}
popSounds_t            = {}
popsPtfx_t             = {}
npc_blips              = {}
spawned_npcs           = {}
plyrProps              = {}
npcProps               = {}
selfPTFX               = {}
npcPTFX                = {}
curr_playing_anim      = {}
laserPtfx_T            = {}
chosen_anim            = {}
default_tire_smoke     = {
  r = 255,
  g = 255,
  b = 255,
}
default_handling_flags = unk


SS.check_kb_keybinds()
SS.check_gpad_keybinds()


DRIFT_BUTTON           = keybinds.tdBtn.name
STOP_ANIM_BUTTON       = keybinds.stop_anim.name
PLAY_ANIM_BUTTON       = keybinds.play_anim.name
PREVIOUS_ANIM_BUTTON   = keybinds.previous_anim.name
NEXT_ANIM_BUTTON       = keybinds.next_anim.name
FLATBED_BUTTON         = keybinds.flatbedBtn.name
AUTOKILL_BUTTON        = keybinds.autokill.name
ENEMIES_FLEE_BUTTON    = keybinds.enemiesFlee.name
VEHICLE_MINE_BUTTON    = keybinds.vehicle_mine.name
KBM_ROD_BUTTON         = keybinds.rodBtn.name
KBM_PURGE_BUTTON       = keybinds.purgeBtn.name
KBM_TRIGGERBOT_BUTTON  = keybinds.triggerbotBtn.name
GPAD_ROD_BUTTON        = gpad_keybinds.rodBtn.name
GPAD_PURGE_BUTTON      = gpad_keybinds.purgeBtn.name
GPAD_TRIGGERBOT_BUTTON = gpad_keybinds.triggerbotBtn.name


require('lib/Translations')
require('data/objects')
require('data/actions')
require('data/refs')


---@param musicSwitch string
---@param station? string
function play_music(musicSwitch, station)
  script.run_in_fiber(function(mp)
    if musicSwitch == "start" then
      local myPos       = self.get_pos()
      local bone_idx    = PED.GET_PED_BONE_INDEX(self.get_ped(), 24818)
      local pbus_model  = 345756458
      local dummy_model = 0xE75B4B1C
      if Game.requestModel(pbus_model) then
        pBus = VEHICLE.CREATE_VEHICLE(pbus_model, myPos.x, myPos.y, (myPos.z - 30), 0, true, false, false)
        ENTITY.SET_ENTITY_VISIBLE(pbus, false, false)
        ENTITY.SET_ENTITY_ALPHA(pBus, 0.0, false)
        ENTITY.FREEZE_ENTITY_POSITION(pBus, true)
        ENTITY.SET_ENTITY_COLLISION(pBus, false, false)
        ENTITY.SET_ENTITY_INVINCIBLE(pBus, true)
        VEHICLE.SET_VEHICLE_ALLOW_HOMING_MISSLE_LOCKON(pBus, false, false)
      end
      mp:sleep(500)
      if ENTITY.DOES_ENTITY_EXIST(pBus) then
        entities.take_control_of(pBus, 300)
        if Game.requestModel(dummy_model) then
          dummyDriver = PED.CREATE_PED(4, dummy_model, myPos.x, myPos.y, (myPos.z + 40), 0, true, false)
          if ENTITY.DOES_ENTITY_EXIST(dummyDriver) then
            entities.take_control_of(dummyDriver, 300)
            ENTITY.SET_ENTITY_ALPHA(dummyDriver, 0.0, false)
            PED.SET_PED_INTO_VEHICLE(dummyDriver, pBus, -1)
            PED.SET_PED_CONFIG_FLAG(dummyDriver, 402, true)
            PED.SET_PED_CONFIG_FLAG(dummyDriver, 398, true)
            PED.SET_PED_CONFIG_FLAG(dummyDriver, 167, true)
            PED.SET_PED_CONFIG_FLAG(dummyDriver, 251, true)
            PED.SET_PED_CONFIG_FLAG(dummyDriver, 255, true)
            PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(dummyDriver, true)
            AUDIO.FORCE_USE_AUDIO_GAME_OBJECT(pBus, vehicles.get_vehicle_display_name(2765724541))
            VEHICLE.SET_VEHICLE_ENGINE_ON(pBus, true, false, false)
            AUDIO.SET_VEHICLE_RADIO_LOUD(pBus, true)
            VEHICLE.SET_VEHICLE_LIGHTS(pBus, 1)
            mp:sleep(500)
            if station ~= nil then
              AUDIO.SET_VEH_RADIO_STATION(pBus, station)
            end
            mp:sleep(500)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(pBus, self.get_ped(), bone_idx, -14.0, -1.3, -1.0, 0.0, 90.0, -90.0, false,
              true,
              false, true, 1, true, 1)
          else
            gui.show_error("Samurais Scripts", "Failed to start music!")
            return
          end
        end
      else
        gui.show_error("Samurais Scripts", "Failed to start music!")
        return
      end
    elseif musicSwitch == "stop" then
      if ENTITY.DOES_ENTITY_EXIST(dummyDriver) then
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(dummyDriver, true, true)
        mp:sleep(200)
        ENTITY.DELETE_ENTITY(dummyDriver)
        dummyDriver = 0
      end
      if ENTITY.DOES_ENTITY_EXIST(pBus) then
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(pBus, true, true)
        mp:sleep(200)
        ENTITY.DELETE_ENTITY(pBus)
        pBus = 0
      end
    end
  end)
end

function dummyCop()
  script.run_in_fiber(function(dcop)
    if current_vehicle ~= nil and current_vehicle ~= 0 then
      local polhash, veh_bone1, veh_bone2, attach_mode
      if is_car then
        if VEHICLE.DOES_VEHICLE_HAVE_ROOF(current_vehicle) and not VEHICLE.IS_VEHICLE_A_CONVERTIBLE(current_vehicle, false) then
          polhash, veh_bone1, veh_bone2, attach_mode = 0xD1E0B7D7, "interiorlight", "interiorlight", 1
        else
          polhash, veh_bone1, veh_bone2, attach_mode = 0xD1E0B7D7, "interiorlight", "dashglow", 2
        end
      elseif is_bike or is_quad then
        polhash, veh_bone1, veh_bone2, attach_mode = 0xFDEFAEC3, "chassis_dummy", "chassis_dummy", 1
      else
        gui.show_error("Samurais Scripts", "Can not equip a fake siren on this vehicle.")
      end
      if Game.requestModel(polhash) then
        dummyCopCar = VEHICLE.CREATE_VEHICLE(polhash, 0.0, 0.0, 0.0, 0, true, false, false)
      end
      if ENTITY.DOES_ENTITY_EXIST(dummyCopCar) then
        if entities.take_control_of(dummyCopCar, 300) then
          ENTITY.SET_ENTITY_COLLISION(dummyCopCar, false, false)
          VEHICLE.SET_VEHICLE_ALLOW_HOMING_MISSLE_LOCKON(dummyCopCar, false, false)
          VEHICLE.SET_VEHICLE_UNDRIVEABLE(dummyCopCar, true)
          ENTITY.SET_ENTITY_ALPHA(dummyCopCar, 49.0, false)
          ENTITY.SET_ENTITY_INVINCIBLE(dummyCopCar, true)
          local boneidx1 = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(dummyCopCar, veh_bone1)
          local boneidx2 = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, veh_bone2)
          VEHICLE.SET_VEHICLE_LIGHTS(dummyCopCar, 1)
          ENTITY.SET_ENTITY_HEADING(dummyCopCar, ENTITY.GET_ENTITY_HEADING(current_vehicle))
          if attach_mode == 1 then
            ENTITY.ATTACH_ENTITY_BONE_TO_ENTITY_BONE(dummyCopCar, current_vehicle, boneidx1, boneidx2, false, true)
          else
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dummyCopCar, current_vehicle, boneidx2, 0.46, 0.4, -0.9, 0.0, 0.0, 0.0, false,
              true,
              false, true, 1, true, 1)
          end
          dcop:sleep(500)
          VEHICLE.SET_VEHICLE_SIREN(dummyCopCar, true)
          VEHICLE.SET_VEHICLE_HAS_MUTED_SIRENS(dummyCopCar, false)
          AUDIO.TRIGGER_SIREN_AUDIO(dummyCopCar)
          VEHICLE.SET_VEHICLE_ACT_AS_IF_HAS_SIREN_ON(current_vehicle, true)
          VEHICLE.SET_VEHICLE_CAUSES_SWERVING(current_vehicle, true)
          VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(current_vehicle, 0, true)
          VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(current_vehicle, 1, true)
        end
      end
    end
  end)
end

function showDriftCounter(text)
  wolrdPos = self.get_pos()
  local _, screenX, screenY = HUD.GET_HUD_SCREEN_POSITION_FROM_WORLD_POSITION(wolrdPos.x, wolrdPos.y, wolrdPos.z, screenX,
    screenY)
  HUD.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("TWOSTRINGS")
  HUD.SET_TEXT_COLOUR(255, 192, 0, 200)
  HUD.SET_TEXT_SCALE(1, 0.7)
  HUD.SET_TEXT_OUTLINE()
  HUD.SET_TEXT_FONT(7)
  HUD.SET_TEXT_CENTRE(true)
  HUD.SET_TEXT_DROP_SHADOW()
  HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text)
  HUD.END_TEXT_COMMAND_DISPLAY_TEXT(screenX, (screenY - 0.6), 0)
end

function showDriftExtra(text)
  wolrdPos = self.get_pos()
  local _, screenX, screenY = HUD.GET_HUD_SCREEN_POSITION_FROM_WORLD_POSITION(wolrdPos.x, wolrdPos.y, wolrdPos.z, screenX,
    screenY)
  HUD.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("TWOSTRINGS")
  HUD.SET_TEXT_COLOUR(255, 192, 0, 200)
  HUD.SET_TEXT_SCALE(1, 0.4)
  HUD.SET_TEXT_OUTLINE()
  HUD.SET_TEXT_FONT(7)
  HUD.SET_TEXT_CENTRE(true)
  HUD.SET_TEXT_DROP_SHADOW()
  HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text)
  HUD.END_TEXT_COMMAND_DISPLAY_TEXT(screenX, (screenY - 0.5142), 0)
end

function checkDriftCollision()
  local crashed     = false
  local text        = ""
  local entity      = ENTITY.GET_LAST_ENTITY_HIT_BY_ENTITY_(self.get_veh())
  local entity_type = Game.getEntityTypeString(entity)
  if ENTITY.IS_ENTITY_A_PED(entity) then
    text = "Hit and run"
    crashed = false
  elseif entity_type == "Vehicle" then
    text = "Samir, you're breaking the car!"
    crashed = true
  elseif entity_type == "Object" then
    -- ENTITY.GET_ENTITY_MODEL(entity) ~= 3300474446 and ENTITY.GET_ENTITY_MODEL(entity) ~= 3231494328 and ENTITY.GET_ENTITY_MODEL(entity) ~= 3008087081 and ENTITY.GET_ENTITY_MODEL(entity) ~= 874602658
    if ENTITY.GET_ENTITY_SPEED(self.get_veh()) > 5 then
      text = "Wrecking ball"
      crashed = false
    else
      text = "Samir, you're breaking the car!"
      crashed = true
    end
  elseif entity_type == "None" or entity_type == "Invalid" then
    text = "Samir, you're breaking the car!"
    crashed = true
  end
  return crashed, text
end

function bankDriftPoints_SP(points)
  local chars_T = {
    { hash = 225514697,  int = 0 },
    { hash = 2602752943, int = 1 },
    { hash = 2608926626, int = 2 },
  }
  script.run_in_fiber(function()
    for _, v in ipairs(chars_T) do
      if ENTITY.GET_ENTITY_MODEL(self.get_ped()) == v.hash then
        stats.set_int("SP" .. tostring(v.int) .. "_TOTAL_CASH",
          stats.get_int("SP" .. tostring(v.int) .. "_TOTAL_CASH") + points)
        AUDIO.PLAY_SOUND_FRONTEND(-1, "LOCAL_PLYR_CASH_COUNTER_INCREASE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", true)
      end
    end
  end)
end

Samurais_scripts:add_imgui(function()
  local date_str = os.date("\10    %d-%b-%Y    \10         %H:%M\10\10")
  ImGui.Dummy(1, 10); ImGui.Dummy(150, 1); ImGui.SameLine();
  ImGui.PushStyleVar(ImGuiStyleVar.FrameRounding, 80)
  UI.coloredButton(tostring(date_str), '#A67C00', '#A67C00', '#A67C00', 0.15)
  ImGui.PopStyleVar()
  if UI.isItemClicked('lmb') then
    debug_counter = debug_counter + 1
    if debug_counter == 7 then
      UI.widgetSound("Nav")
      log.debug("Debug mode activated.")
      SS_debug = true
    elseif debug_counter > 7 then
      UI.widgetSound("Cancel")
      log.debug("Debug mode deactivated.")
      SS_debug      = false
      debug_counter = 0
    end
  end
  ImGui.Dummy(1, 10); ImGui.SeparatorText("About")
  UI.wrappedText("A collection of scripts aimed towards adding some roleplaying and fun elements to the game.", 25)
  ImGui.Dummy(1, 10)
  ImGui.BulletText("Script Version:   v" .. SCRIPT_VERSION)
  ImGui.BulletText("Game Version:   b" .. TARGET_BUILD .. "   Online " .. TARGET_VERSION)
  if not disable_quotes then
    ImGui.Dummy(1, 20); ImGui.SeparatorText("Quote Of The Day"); ImGui.Spacing()
    UI.coloredText(random_quote, 'white', quote_alpha, 24)
  end
end)

--[[
    *self*
]]
self_tab = Samurais_scripts:add_tab(translateLabel("Self"))
self_tab:add_imgui(function()
  Regen, RegenUsed = ImGui.Checkbox(translateLabel("Auto-Heal"), Regen)
  UI.helpMarker(false, translateLabel("autoheal_tooltip"))
  if RegenUsed then
    lua_cfg.save("Regen", Regen)
    UI.widgetSound("Nav2")
  end

  -- objectiveTP, objectiveTPUsed = ImGui.Checkbox(translateLabel("objectiveTP"), objectiveTP)
  -- UI.helpMarker(false, translateLabel("objectiveTP_tooltip"))
  -- if objectiveTPUsed then
  --   lua_cfg.save("objectiveTP", objectiveTP)
  --   UI.widgetSound("Nav2")
  -- end

  replaceSneakAnim, rsanimUsed = ImGui.Checkbox(translateLabel("CrouchCB"), replaceSneakAnim)
  UI.helpMarker(false, translateLabel("Crouch_tooltip"))
  if rsanimUsed then
    lua_cfg.save("replaceSneakAnim", replaceSneakAnim)
    UI.widgetSound("Nav2")
  end

  replacePointAct, rpaUsed = ImGui.Checkbox(translateLabel("rpaCB"), replacePointAct)
  UI.helpMarker(false, translateLabel("rpa_tooltip"))
  if rpaUsed then
    lua_cfg.save("replacePointAct", replacePointAct)
    UI.widgetSound("Nav2")
  end

  phoneAnim, phoneAnimUsed = ImGui.Checkbox(translateLabel("PhoneAnimCB"), phoneAnim)
  UI.helpMarker(false, translateLabel("PhoneAnim_tooltip"))
  if phoneAnimUsed then
    lua_cfg.save("phoneAnim", phoneAnim)
    UI.widgetSound("Nav2")
  end

  sprintInside, sprintInsideUsed = ImGui.Checkbox(translateLabel("SprintInsideCB"), sprintInside)
  UI.helpMarker(false,
    translateLabel("SprintInside_tooltip"))
  if sprintInsideUsed then
    lua_cfg.save("sprintInside", sprintInside)
    UI.widgetSound("Nav2")
  end

  lockPick, lockPickUsed = ImGui.Checkbox(translateLabel("LockpickCB"), lockPick)
  UI.helpMarker(false,
    translateLabel("Lockpick_tooltip"))
  if lockPickUsed then
    lua_cfg.save("lockPick", lockPick)
    UI.widgetSound("Nav2")
  end

  disableActionMode, actionModeUsed = ImGui.Checkbox(translateLabel("ActionModeCB"), disableActionMode)
  UI.helpMarker(false, translateLabel("ActionMode_tooltip"))
  if actionModeUsed then
    lua_cfg.save("disableActionMode", disableActionMode)
    UI.widgetSound("Nav2")
  end

  clumsy, clumsyUsed = ImGui.Checkbox("Clumsy", clumsy)
  UI.helpMarker(false, translateLabel("clumsy_tt"))
  if clumsyUsed then
    rod = false
    lua_cfg.save("rod", false)
    lua_cfg.save("clumsy", clumsy)
    UI.widgetSound("Nav2")
  end
  if clumsy and clumsyUsed then
    script.run_in_fiber(function()
      if not PED.CAN_PED_RAGDOLL(self.get_ped()) then
        gui.show_warning("Samurais Scripts",
          "This option will not work if you're blocking ragdoll. Please make sure 'No Ragdoll' option is disabled in YimMennu.")
      end
    end)
  end

  rod, rodUsed = ImGui.Checkbox("Ragdoll On Demand", rod)
  UI.helpMarker(false, translateLabel("rod_tt"))
  if rodUsed then
    clumsy = false
    lua_cfg.save("rod", rod)
    lua_cfg.save("clumsy", false)
    UI.widgetSound("Nav2")
  end
  if rod and rodUsed then
    script.run_in_fiber(function()
      if not PED.CAN_PED_RAGDOLL(self.get_ped()) then
        gui.show_warning("Samurais Scripts",
          "This option will not work if you're blocking ragdoll. Please make sure 'No Ragdoll' option is disabled in YimMennu.")
      end
    end)
  end

  if rod or clumsy then
    ragdoll_sound, rgdlsnd = ImGui.Checkbox("Ragdoll Sound", ragdoll_sound)
    UI.helpMarker(false, translateLabel("ragdoll_sound_tt"))
    if rgdlsnd then
      UI.widgetSound("Nav2")
      lua_cfg.save("ragdoll_sound", ragdoll_sound)
    end
  end

  hideFromCops, hfcUsed = ImGui.Checkbox("Hide & Seek", hideFromCops)
  UI.helpMarker(false, translateLabel("hide&seek_tt"))
  if hfcUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("hideFromCops", hideFromCops)
  end
end)


Actions = self_tab:add_tab("Actions ")

local function updatefilteredAnims()
  filteredAnims = {}
  for _, anim in ipairs(animlist) do
    if string.find(string.lower(anim.name), string.lower(actions_search)) then
      table.insert(filteredAnims, anim)
    end
  end
  table.sort(animlist, function(a, b)
    return a.name < b.name
  end)
end

local function displayFilteredAnims()
  updatefilteredAnims()
  local animNames = {}
  for _, anim in ipairs(filteredAnims) do
    table.insert(animNames, anim.name)
  end
  anim_index, used = ImGui.ListBox("##animlistbox", anim_index, animNames, #filteredAnims)
end

local function updatefilteredScenarios()
  filteredScenarios = {}
  for _, scene in ipairs(ped_scenarios) do
    if string.find(string.lower(scene.name), string.lower(actions_search)) then
      table.insert(filteredScenarios, scene)
    end
  end
end

local function displayFilteredScenarios()
  updatefilteredScenarios()
  local scenarioNames = {}
  for _, scene in ipairs(filteredScenarios) do
    table.insert(scenarioNames, scene.name)
  end
  scenario_index, used = ImGui.ListBox("##scenarioList", scenario_index, scenarioNames, #filteredScenarios)
end

local function updateRecentlyPlayed()
  filteredRecents = {}
  for _, v in ipairs(recently_played_a) do
    if string.find(string.lower(v.name), string.lower(actions_search)) then
      table.insert(filteredRecents, v)
    end
  end
end

local function displayRecentlyPlayed()
  updateRecentlyPlayed()
  local recentNames = {}
  for _, v in ipairs(filteredRecents) do
    local recentName = v.name
    if v.dict ~= nil then
      recentName = "[Animation]  " .. recentName
    elseif v.scenario ~= nil then
      recentName = "[Scenario]    " .. recentName
    end
    table.insert(recentNames, recentName)
  end
  recents_index, used = ImGui.ListBox("##recentsList", recents_index, recentNames, #filteredRecents)
end

local function updateFavoriteActions()
  filteredFavs = {}
  for _, v in ipairs(favorite_actions) do
    if string.find(string.lower(v.name), string.lower(actions_search)) then
      table.insert(filteredFavs, v)
    end
  end
end

local function displayFavoriteActions()
  updateFavoriteActions()
  local favNames = {}
  for _, v in ipairs(filteredFavs) do
    local favName = v.name
    if v.dict ~= nil then
      favName = "[Animation]  " .. favName
    elseif v.scenario ~= nil then
      favName = "[Scenario]    " .. favName
    end
    table.insert(favNames, favName)
  end
  fav_actions_index, used = ImGui.ListBox("##favsList", fav_actions_index, favNames, #filteredFavs)
end

local function updateNpcs()
  filteredNpcs = {}
  for _, npc in ipairs(npcList) do
    table.insert(filteredNpcs, npc)
  end
  table.sort(filteredNpcs, function(a, b)
    return a.name < b.name
  end)
end

local function displayNpcs()
  updateNpcs()
  local npcNames = {}
  for _, npc in ipairs(filteredNpcs) do
    table.insert(npcNames, npc.name)
  end
  npc_index, used = ImGui.Combo("##npcList", npc_index, npcNames, #filteredNpcs)
end

local function setmanualflag()
  if looped then
    flag_loop = 1
  else
    flag_loop = 0
  end
  if freeze then
    flag_freeze = 2
  else
    flag_freeze = 0
  end
  if upperbody then
    flag_upperbody = 16
  else
    flag_upperbody = 0
  end
  if controllable then
    flag_control = 32
  else
    flag_control = 0
  end
  flag = flag_loop + flag_freeze + flag_upperbody + flag_control
end

local function setdrunk()
  script.run_in_fiber(function()
    -- PED.SET_PED_USING_ACTION_MODE(PLAYER.PLAYER_ID(), false, -1, -1)
    while not STREAMING.HAS_CLIP_SET_LOADED("move_m@drunk@verydrunk") and not STREAMING.HAS_CLIP_SET_LOADED("move_strafe@first_person@drunk") do
      STREAMING.REQUEST_CLIP_SET("move_m@drunk@verydrunk")
      STREAMING.REQUEST_CLIP_SET("move_strafe@first_person@drunk")
      coroutine.yield()
    end
    PED.SET_PED_MOVEMENT_CLIPSET(self.get_ped(), "move_m@drunk@verydrunk", 1.0)
    PED.SET_PED_WEAPON_MOVEMENT_CLIPSET(self.get_ped(), "move_m@drunk@verydrunk")
    PED.SET_PED_STRAFE_CLIPSET(self.get_ped(), "move_strafe@first_person@drunk")
    WEAPON.SET_WEAPON_ANIMATION_OVERRIDE(self.get_ped(), 2231620617)
    currentMvmt  = "move_m@drunk@verydrunk"
    currentWmvmt = "move_m@drunk@verydrunk"
    currentStrf  = "move_strafe@first_person@drunk"
  end)
end

local function sethoe()
  script.run_in_fiber(function()
    while not STREAMING.HAS_CLIP_SET_LOADED("move_f@maneater") do
      STREAMING.REQUEST_CLIP_SET("move_f@maneater")
      coroutine.yield()
    end
    PED.RESET_PED_WEAPON_MOVEMENT_CLIPSET(self.get_ped())
    PED.RESET_PED_STRAFE_CLIPSET(self.get_ped())
    PED.SET_PED_MOVEMENT_CLIPSET(self.get_ped(), "move_f@maneater", 1.0)
    WEAPON.SET_WEAPON_ANIMATION_OVERRIDE(self.get_ped(), 1830115867)
    currentMvmt  = "move_f@maneater"
    currentWmvmt = ""
    currentStrf  = ""
  end)
end

local function setgangsta()
  script.run_in_fiber(function()
    while not STREAMING.HAS_CLIP_SET_LOADED("move_m@gangster@ng") do
      STREAMING.REQUEST_CLIP_SET("move_m@gangster@ng")
      coroutine.yield()
    end
    while not STREAMING.HAS_CLIP_SET_LOADED("move_strafe@gang") do
      STREAMING.REQUEST_CLIP_SET("move_strafe@gang")
      coroutine.yield()
    end
    PED.RESET_PED_WEAPON_MOVEMENT_CLIPSET(self.get_ped())
    PED.SET_PED_MOVEMENT_CLIPSET(self.get_ped(), "move_m@gangster@ng", 0.3)
    PED.SET_PED_STRAFE_CLIPSET(self.get_ped(), "move_strafe@gang")
    WEAPON.SET_WEAPON_ANIMATION_OVERRIDE(self.get_ped(), 1917483703)
    currentMvmt  = "move_m@gangster@ng"
    currentStrf  = "move_strafe@gang"
    currentWmvmt = ""
  end)
end

local function setlester()
  script.run_in_fiber(function()
    while not STREAMING.HAS_CLIP_SET_LOADED("move_heist_lester") do
      STREAMING.REQUEST_CLIP_SET("move_heist_lester")
      coroutine.yield()
    end
    PED.RESET_PED_WEAPON_MOVEMENT_CLIPSET(self.get_ped())
    PED.RESET_PED_STRAFE_CLIPSET(self.get_ped())
    PED.SET_PED_MOVEMENT_CLIPSET(self.get_ped(), "move_heist_lester", 0.4)
    WEAPON.SET_WEAPON_ANIMATION_OVERRIDE(self.get_ped(), 2231620617)
    currentMvmt  = "move_heist_lester"
    currentWmvmt = ""
    currentStrf  = ""
  end)
end

local function setballistic()
  script.run_in_fiber(function()
    while not STREAMING.HAS_CLIP_SET_LOADED("anim_group_move_ballistic") and not STREAMING.HAS_CLIP_SET_LOADED("move_strafe@ballistic") do
      STREAMING.REQUEST_CLIP_SET("anim_group_move_ballistic")
      STREAMING.REQUEST_CLIP_SET("move_strafe@ballistic")
      coroutine.yield()
    end
    PED.RESET_PED_WEAPON_MOVEMENT_CLIPSET(self.get_ped())
    PED.SET_PED_MOVEMENT_CLIPSET(self.get_ped(), "anim_group_move_ballistic", 1)
    PED.SET_PED_STRAFE_CLIPSET(self.get_ped(), "move_strafe@ballistic")
    WEAPON.SET_WEAPON_ANIMATION_OVERRIDE(self.get_ped(), 1429513766)
    currentMvmt = "anim_group_move_ballistic"
    currentStrf = "move_strafe@ballistic"
    currentWmvmt = ""
  end)
end

---@param s script_util
function onAnimInterrupt(s)
  s:sleep(1000)
  if is_playing_anim and not SS.isKeyJustPressed(keybinds.stop_anim.code) then
    if Game.requestAnimDict(curr_playing_anim.dict) then
      TASK.CLEAR_PED_TASKS_IMMEDIATELY(self.get_ped())
      TASK.TASK_PLAY_ANIM(self.get_ped(), curr_playing_anim.dict, curr_playing_anim.anim, 4.0, -4.0, -1,
        curr_playing_anim.flag, 1.0, false, false, false)
    end
  end
end

Actions:add_imgui(function()
  ImGui.Dummy(60, 1); ImGui.SameLine()
  ImGui.PushItemWidth(270)
  actions_search, used = ImGui.InputTextWithHint("##searchBar", translateLabel("search_hint"), actions_search, 32)
  ImGui.PopItemWidth()
  if ImGui.IsItemActive() then
    is_typing = true
  else
    is_typing = false
  end
  ImGui.BeginTabBar("Actionz", ImGuiTabBarFlags.None)
  if ImGui.BeginTabItem(translateLabel("animations")) then
    if tab1Sound then
      UI.widgetSound("Nav")
      tab1Sound = false
      tab2Sound = true
      tab3Sound = true
    end
    ImGui.PushItemWidth(420) -- whatcha smokin'?
    displayFilteredAnims()
    ImGui.PopItemWidth()
    if filteredAnims ~= nil then
      info = filteredAnims[anim_index + 1]
    end
    ImGui.Separator(); manualFlags, used = ImGui.Checkbox("Edit Flags", manualFlags)
    if used then
      lua_cfg.save("manualFlags", manualFlags)
      UI.widgetSound("Nav2")
    end
    UI.helpMarker(false, translateLabel("flags_tt"))
    ImGui.SameLine(); disableProps, used = ImGui.Checkbox("Disable Props", disableProps)
    if used then
      lua_cfg.save("disableProps", disableProps)
      UI.widgetSound("Nav2")
    end
    UI.helpMarker(false, translateLabel("DisableProps_tt"))
    if manualFlags then
      ImGui.Separator()
      controllable, used = ImGui.Checkbox(translateLabel("Allow Control"), controllable)
      if used then
        lua_cfg.save("controllable", controllable)
        UI.widgetSound("Nav2")
      end
      UI.helpMarker(false, translateLabel("AllowControl_tt"))
      ImGui.SameLine(); ImGui.Dummy(27, 1); ImGui.SameLine()
      looped, used = ImGui.Checkbox("Loop", looped)
      if used then
        lua_cfg.save("looped", looped)
        UI.widgetSound("Nav2")
      end
      UI.helpMarker(false, translateLabel("looped_tt"))
      upperbody, used = ImGui.Checkbox(translateLabel("Upper Body Only"), upperbody)
      if used then
        lua_cfg.save("upperbody", upperbody)
        UI.widgetSound("Nav2")
      end
      UI.helpMarker(false, translateLabel("UpperBodyOnly_tt"))
      ImGui.SameLine(); ImGui.Dummy(1, 1); ImGui.SameLine()
      freeze, used = ImGui.Checkbox(translateLabel("Freeze"), freeze)
      if used then
        lua_cfg.save("freeze", freeze)
        UI.widgetSound("Nav2")
      end
      UI.helpMarker(false, translateLabel("Freeze_tt"))
    end
    if ImGui.Button(translateLabel("generic_play_btn") .. "##anim") then
      if not ped_grabbed and not vehicle_grabbed then
        UI.widgetSound("Select")
        script.run_in_fiber(function(pa)
          local coords     = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
          local heading    = ENTITY.GET_ENTITY_HEADING(self.get_ped())
          local forwardX   = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
          local forwardY   = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
          local boneIndex  = PED.GET_PED_BONE_INDEX(self.get_ped(), info.boneID)
          local bonecoords = PED.GET_PED_BONE_COORDS(self.get_ped(), info.boneID, 0.0, 0.0, 0.0)
          if manualFlags then
            setmanualflag()
          else
            flag = info.flag
          end
          curr_playing_anim = info
          if lua_Fn.str_contains(curr_playing_anim.name, "DJ") then
            if not is_playing_radio and not anim_music then
              play_music("start", "RADIO_22_DLC_BATTLE_MIX1_RADIO")
              anim_music = true
            end
          else
            if anim_music then
              play_music("stop")
              anim_music = false
            end
          end
          playAnim(info, self.get_ped(), flag, selfprop1, selfprop2, selfloopedFX, selfSexPed, boneIndex, coords, heading,
            forwardX, forwardY, bonecoords, "self", plyrProps, selfPTFX, pa)
          is_playing_anim = true
          addActionToRecents(info)
        end)
      else
        UI.widgetSound("Error")
        gui.show_error("Samurais Scripts",
          translateLabel("You can not play animations while grabbing an NPC or a vehicle."))
      end
    end
    ImGui.SameLine()
    if ImGui.Button(translateLabel("generic_stop_btn") .. "##anim") then
      if is_playing_anim then
        UI.widgetSound("Cancel")
        script.run_in_fiber(function(cu)
          cleanup(cu)
          is_playing_anim = false
          if anim_music then
            play_music("stop")
            anim_music = false
          end
        end)
      else
        UI.widgetSound("Error")
      end
    end
    UI.toolTip(false, translateLabel("stopAnims_tt"))
    ImGui.SameLine(); ImGui.Dummy(12, 1); ImGui.SameLine()
    local errCol = {}
    local errSound = false
    if plyrProps[1] ~= nil then
      errCol = { 104, 247, 114, 0.2 }
      errSound = false
    else
      errCol = { 225, 0, 0, 0.5 }
      errSound = true
    end
    if UI.coloredButton(translateLabel("Remove Attachments"), { 104, 247, 114 }, { 104, 247, 114 }, errCol, 0.6) then
      if not errSound then
        UI.widgetSound("Cancel")
      else
        UI.widgetSound("Error")
      end
      script.run_in_fiber(function()
        if all_objects == nil then
          all_objects = entities.get_all_objects_as_handles()
        end
        for _, v in ipairs(all_objects) do
          local modelHash      = ENTITY.GET_ENTITY_MODEL(v)
          local attachedObject = ENTITY.GET_ENTITY_OF_TYPE_ATTACHED_TO_ENTITY(self.get_ped(), modelHash)
          if ENTITY.DOES_ENTITY_EXIST(attachedObject) then
            ENTITY.DETACH_ENTITY(attachedObject, true, true)
            ENTITY.SET_ENTITY_AS_NO_LONGER_NEEDED(attachedObject)
            TASK.CLEAR_PED_TASKS(self.get_ped())
          end
        end
        if all_peds == nil then
          all_peds = entities.get_all_peds_as_handles()
        end
        for _, p in ipairs(all_peds) do
          local pedHash     = ENTITY.GET_ENTITY_MODEL(p)
          local attachedPed = ENTITY.GET_ENTITY_OF_TYPE_ATTACHED_TO_ENTITY(self.get_ped(), pedHash)
          if ENTITY.DOES_ENTITY_EXIST(attachedPed) then
            ENTITY.DETACH_ENTITY(attachedPed, true, true)
            TASK.CLEAR_PED_TASKS(self.get_ped())
            TASK.CLEAR_PED_TASKS(attachedPed)
            ENTITY.SET_ENTITY_AS_NO_LONGER_NEEDED(attachedPed)
          end
        end
        is_playing_anim = false
        if is_playing_scenario then
          if ENTITY.DOES_ENTITY_EXIST(bbq) then
            ENTITY.DELETE_ENTITY(bbq)
          end
          is_playing_scenario = false
        end
        if ped_grabbed then
          ENTITY.FREEZE_ENTITY_POSITION(attached_ped, false)
          TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(attached_ped, false)
          PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(attached_ped, false)
          PED.SET_PED_TO_RAGDOLL(attached_ped, 1500, 0, 0, false, false, false)
          TASK.CLEAR_PED_TASKS(self.get_ped())
          PED.SET_PED_CAN_SWITCH_WEAPON(self.get_ped(), true)
        end
        if plyrProps[1] ~= nil then
          for _, v in ipairs(plyrProps) do
            table.remove(v)
          end
        else
          if not ped_grabbed then
            gui.show_error("Samurais Scripts", "There are no objects or peds attached.")
          else
            ped_grabbed = false
          end
        end
      end)
    end
    UI.toolTip(false, translateLabel("RemoveAttachments_tt"))
    if info ~= nil then
      if shortcut_anim.name ~= info.name then
        if ImGui.Button(translateLabel("animShortcut_btn")) then
          chosen_anim        = info
          is_setting_hotkeys = true
          UI.widgetSound("Select2")
          ImGui.OpenPopup("Set Shortcut")
        end
        UI.toolTip(false, translateLabel("animShortcut_tt"))
        ImGui.SetNextWindowPos(760, 400, ImGuiCond.Appearing)
        ImGui.SetNextWindowBgAlpha(0.9)
        if ImGui.BeginPopupModal("Set Shortcut", true, ImGuiWindowFlags.AlwaysAutoResize | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.NoTitleBar) then
          UI.coloredText("Selected Animation:  ", "green", 0.9, 20); ImGui.SameLine(); ImGui.Text("« " ..
            chosen_anim.name .. " »")
          ImGui.Dummy(1, 10)
          if btn_name == nil then
            start_loading_anim = true
            UI.coloredText(translateLabel("input_waiting") .. loading_label, "#FFFFFF", 0.75, 20)
            is_pressed, btn, btn_name = SS.isAnyKeyPressed()
          else
            start_loading_anim = false
            for _, key in pairs(reserved_keys_T.kb) do
              if btn == key then
                _reserved = true
                break
              else
                _reserved = false
              end
            end
            if not _reserved then
              ImGui.Text("Shortcut Button: "); ImGui.SameLine(); ImGui.Text(btn_name)
            else
              UI.coloredText(translateLabel("reserved_button"), "red", 0.86, 20)
            end
            ImGui.SameLine(); ImGui.Dummy(5, 1); ImGui.SameLine()
            if UI.coloredButton(" " .. translateLabel("generic_clear_btn") .. " ##Shortcut", "#FFDB58", "#FFFAA0", "#FFFFF0", 0.7) then
              UI.widgetSound("Error")
              btn, btn_name = nil, nil
            end
          end
          ImGui.Dummy(1, 10)
          if not _reserved and btn ~= nil then
            if ImGui.Button(translateLabel("generic_confirm_btn") .. "##shotcut") then
              UI.widgetSound("Select")
              if manualFlags then
                setmanualflag()
              else
                flag = chosen_anim.flag
              end
              shortcut_anim     = chosen_anim
              shortcut_anim.btn = btn
              lua_cfg.save("shortcut_anim", shortcut_anim)
              gui.show_success("Samurais Scripts",
                translateLabel("shortcut_success_1/2") .. btn_name .. translateLabel("shortcut_success_2/2"))
              btn, btn_name      = nil, nil
              is_setting_hotkeys = false
              ImGui.CloseCurrentPopup()
            end
            ImGui.SameLine(); ImGui.Spacing(); ImGui.SameLine()
          end
          if ImGui.Button(translateLabel("generic_cancel_btn") .. "##shotcut") then
            UI.widgetSound("Cancel")
            btn, btn_name      = nil, nil
            start_loading_anim = false
            is_setting_hotkeys = false
            ImGui.CloseCurrentPopup()
          end
          ImGui.End()
        end
      else
        if ImGui.Button(translateLabel("removeShortcut_btn")) then
          UI.widgetSound("Delete")
          shortcut_anim = {}
          lua_cfg.save("shortcut_anim", {})
          gui.show_success("Samurais Scripts", "Animation shortcut has been reset.")
        end
        UI.toolTip(false, translateLabel("removeShortcut_tt"))
      end
      ImGui.SameLine(); ImGui.Dummy(4, 1); ImGui.SameLine()
      if favorite_actions[1] ~= nil then
        for _, v in ipairs(favorite_actions) do
          if info.name == v.name then
            fav_exists = true
            break
          else
            fav_exists = false
          end
        end
      else
        if fav_exists then
          fav_exists = false
        end
      end
      if not fav_exists then
        if ImGui.Button(translateLabel("add_to_favs") .. "##anims") then
          UI.widgetSound("Select")
          table.insert(favorite_actions, info)
          lua_cfg.save("favorite_actions", favorite_actions)
        end
      else
        if ImGui.Button(translateLabel("remove_from_favs")) then
          UI.widgetSound("Delete")
          for k, v in ipairs(favorite_actions) do
            if v == info then
              table.remove(favorite_actions, k)
            end
          end
          lua_cfg.save("favorite_actions", favorite_actions)
        end
      end
    end
    ImGui.Spacing(); ImGui.SeparatorText(translateLabel("Movement Options:")); ImGui.Spacing()
    local isChanged = false
    actions_switch, isChanged = ImGui.RadioButton("Normal", actions_switch, 0)
    if isChanged then
      UI.widgetSound("Nav")
      PED.RESET_PED_MOVEMENT_CLIPSET(self.get_ped(), 0.3)
      PED.RESET_PED_STRAFE_CLIPSET(self.get_ped())
      PED.RESET_PED_WEAPON_MOVEMENT_CLIPSET(self.get_ped())
      WEAPON.SET_WEAPON_ANIMATION_OVERRIDE(self.get_ped(), 3839837909)
      currentMvmt  = ""
      currentStrf  = ""
      currentWmvmt = ""
      isChanged    = false
    end
    ImGui.SameLine(); ImGui.Dummy(23, 1); ImGui.SameLine()
    actions_switch, isChanged = ImGui.RadioButton("Drunk", actions_switch, 1)
    if isChanged then
      setdrunk()
      UI.widgetSound("Nav")
    end
    ImGui.SameLine(); ImGui.Dummy(22, 1); ImGui.SameLine()
    actions_switch, isChanged = ImGui.RadioButton("Hoe", actions_switch, 2)
    if isChanged then
      sethoe()
      UI.widgetSound("Nav")
    end
    actions_switch, isChanged = ImGui.RadioButton("Gangsta ", actions_switch, 3)
    if isChanged then
      setgangsta()
      UI.widgetSound("Nav")
    end
    ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine()
    actions_switch, isChanged = ImGui.RadioButton(" Lester ", actions_switch, 4)
    if isChanged then
      setlester()
      UI.widgetSound("Nav")
    end
    ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine()
    actions_switch, isChanged = ImGui.RadioButton("Heavy", actions_switch, 5)
    if isChanged then
      setballistic()
      UI.widgetSound("Nav")
    end
    ImGui.Spacing(); ImGui.SeparatorText(translateLabel("Play Animations On NPCs:"))
    ImGui.PushItemWidth(220)
    displayNpcs()
    ImGui.PopItemWidth()
    if UI.isItemClicked("lmb") then
      UI.widgetSound("Nav2")
    end
    ImGui.SameLine()
    npc_godMode, used = ImGui.Checkbox("Invincible", npc_godMode)
    if used then
      lua_cfg.save("npc_godMode", npc_godMode)
      UI.widgetSound("Nav")
    end
    UI.toolTip(false, translateLabel("Spawn NPCs in God Mode."))
    if ImGui.Button(translateLabel("Spawn") .. "##anim_npc") then
      UI.widgetSound("Select")
      script.run_in_fiber(function()
        local npcData     = filteredNpcs[npc_index + 1]
        local pedCoords   = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
        local pedHeading  = ENTITY.GET_ENTITY_HEADING(self.get_ped())
        local pedForwardX = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
        local pedForwardY = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
        local myGroup     = PED.GET_PED_GROUP_INDEX(self.get_ped())
        if not PED.DOES_GROUP_EXIST(myGroup) then
          myGroup = PED.CREATE_GROUP(0)
        end
        PED.SET_GROUP_SEPARATION_RANGE(myGroup, 16960)
        while not STREAMING.HAS_MODEL_LOADED(npcData.hash) do
          STREAMING.REQUEST_MODEL(npcData.hash)
          coroutine.yield()
        end
        npc = PED.CREATE_PED(npcData.group, npcData.hash, 0.0, 0.0, 0.0, 0.0, true, false)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(npc, pedCoords.x + pedForwardX * 1.4, pedCoords.y + pedForwardY * 1.4,
          pedCoords.z, true, false, false)
        ENTITY.SET_ENTITY_HEADING(npc, pedHeading - 180)
        PED.SET_PED_AS_GROUP_MEMBER(npc, myGroup)
        PED.SET_PED_NEVER_LEAVES_GROUP(npc, true)
        npcBlip = HUD.ADD_BLIP_FOR_ENTITY(npc)
        table.insert(npc_blips, npcBlip)
        HUD.SET_BLIP_AS_FRIENDLY(npcBlip, true)
        HUD.SET_BLIP_SCALE(npcBlip, 0.8)
        HUD.SHOW_HEADING_INDICATOR_ON_BLIP(npcBlip, true)
        WEAPON.GIVE_WEAPON_TO_PED(npc, 350597077, 9999, false, true)
        PED.SET_GROUP_FORMATION(myGroup, 2)
        PED.SET_GROUP_FORMATION_SPACING(myGroup, 1.0, 1.0, 1.0)
        PED.SET_PED_CONFIG_FLAG(npc, 179, true)
        PED.SET_PED_CONFIG_FLAG(npc, 294, true)
        PED.SET_PED_CONFIG_FLAG(npc, 398, true)
        PED.SET_PED_CONFIG_FLAG(npc, 401, true)
        PED.SET_PED_CONFIG_FLAG(npc, 443, true)
        PED.SET_PED_COMBAT_ABILITY(npc, 2)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 2, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 3, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 5, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 13, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 20, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 21, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 22, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 27, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 28, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 31, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 34, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 41, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 42, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 46, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 50, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 58, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 61, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 71, true)
        if npc_godMode then
          ENTITY.SET_ENTITY_INVINCIBLE(npc, true)
        end
        table.insert(spawned_npcs, npc)
      end)
    end
    ImGui.SameLine()
    if ImGui.Button(translateLabel("generic_delete") .. "##anim_npc") then
      UI.widgetSound("Delete")
      script.run_in_fiber(function(cu)
        cleanupNPC(cu)
        for k, v in ipairs(spawned_npcs) do
          if ENTITY.DOES_ENTITY_EXIST(v) then
            PED.REMOVE_PED_FROM_GROUP(v)
            ENTITY.DELETE_ENTITY(v)
          end
          table.remove(spawned_npcs, k)
        end
        is_playing_anim = false
      end)
    end
    ImGui.SameLine()
    if ImGui.Button(translateLabel("generic_play_btn") .. "##npc_anim") then
      if spawned_npcs[1] ~= nil then
        UI.widgetSound("Select")
        script.run_in_fiber(function(npca)
          for _, v in ipairs(spawned_npcs) do
            if ENTITY.DOES_ENTITY_EXIST(v) then
              local npcCoords      = ENTITY.GET_ENTITY_COORDS(v, false)
              local npcHeading     = ENTITY.GET_ENTITY_HEADING(v)
              local npcForwardX    = ENTITY.GET_ENTITY_FORWARD_X(v)
              local npcForwardY    = ENTITY.GET_ENTITY_FORWARD_Y(v)
              local npcBoneIndex   = PED.GET_PED_BONE_INDEX(v, info.boneID)
              local npcBboneCoords = PED.GET_PED_BONE_COORDS(v, info.boneID, 0.0, 0.0, 0.0)
              if manualFlags then
                setmanualflag()
              else
                flag = info.flag
              end
              playAnim(info, v, flag, npcprop1, npcprop2, npcloopedFX, npcSexPed, npcBoneIndex, npcCoords, npcHeading,
                npcForwardX, npcForwardY, npcBboneCoords, "cunt", npcProps, npcPTFX, npca
              )
            end
          end
        end)
      else
        UI.widgetSound("Error")
        gui.show_error("Samurais Scripts", "Spawn an NPC first!")
      end
    end
    ImGui.SameLine()
    if ImGui.Button(translateLabel("generic_stop_btn") .. "##npc_anim") then
      UI.widgetSound("Cancel")
      script.run_in_fiber(function(npca)
        cleanupNPC(npca)
        is_playing_anim = false
      end)
    end
    usePlayKey, upkUsed = ImGui.Checkbox("Enable Animation Hotkeys", usePlayKey)
    UI.toolTip(false, translateLabel("animKeys_tt"))
    if upkUsed then
      lua_cfg.save("usePlayKey", usePlayKey)
      UI.widgetSound("Nav2")
    end
    ImGui.EndTabItem()
  end
  if ImGui.BeginTabItem(translateLabel("scenarios")) then
    if tab2Sound then
      UI.widgetSound("Nav2")
      tab2Sound = false
      tab1Sound = true
      tab3Sound = true
    end
    ImGui.PushItemWidth(420)
    displayFilteredScenarios()
    ImGui.PopItemWidth()
    if filteredScenarios ~= nil then
      data = filteredScenarios[scenario_index + 1]
    end
    ImGui.Separator()
    if ImGui.Button(translateLabel("generic_play_btn") .. "##scenarios") then
      if not ped_grabbed and not vehicle_grabbed then
        UI.widgetSound("Select")
        script.run_in_fiber(function(psc)
          if Game.Self.isOnFoot() then
            if is_playing_anim then
              cleanup(psc)
            end
            playScenario(data, self.get_ped())
            addActionToRecents(data)
            is_playing_scenario = true
          else
            gui.show_error("Samurai's Scripts", "You can not play scenarios in vehicles.")
          end
        end)
      else
        gui.show_error("Samurais Scripts",
          translateLabel("You can not play scenarios while grabbing an NPC or a vehicle."))
      end
    end
    ImGui.SameLine(); ImGui.Dummy(60, 1); ImGui.SameLine()
    if ImGui.Button(translateLabel("generic_stop_btn") .. "##scenarios") then
      if is_playing_scenario then
        UI.widgetSound("Cancel")
        script.run_in_fiber(function(stp)
          stopScenario(self.get_ped(), stp)
        end)
      else
        UI.widgetSound("Error")
      end
    end
    UI.toolTip(false, translateLabel("stopScenarios_tt"))
    ImGui.Spacing()
    if favorite_actions[1] ~= nil and filteredScenarios[1] ~= nil then
      for _, v in ipairs(favorite_actions) do
        if data.name == v.name then
          fav_exists = true
          break
        else
          fav_exists = false
        end
      end
    else
      if fav_exists then
        fav_exists = false
      end
    end
    if not fav_exists then
      if ImGui.Button(translateLabel("add_to_favs") .. "##scenarios") then
        UI.widgetSound("Select")
        table.insert(favorite_actions, data)
        lua_cfg.save("favorite_actions", favorite_actions)
      end
    else
      if ImGui.Button(translateLabel("remove_from_favs") .. "##scenarios") then
        UI.widgetSound("Delete")
        for k, v in ipairs(favorite_actions) do
          if v == data then
            table.remove(favorite_actions, k)
          end
        end
        lua_cfg.save("favorite_actions", favorite_actions)
      end
    end
    ImGui.Spacing(); ImGui.SeparatorText(translateLabel("Play Scenarios On NPCs:"))
    ImGui.PushItemWidth(220)
    displayNpcs()
    ImGui.PopItemWidth()
    ImGui.SameLine()
    npc_godMode, used = ImGui.Checkbox("Invincible", npc_godMode)
    UI.toolTip(false, translateLabel("Spawn NPCs in God Mode."))
    local npcData = filteredNpcs[npc_index + 1]
    if ImGui.Button(translateLabel("Spawn") .. "##scenario_npc") then
      UI.widgetSound("Select")
      script.run_in_fiber(function()
        local pedCoords = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
        local pedHeading = ENTITY.GET_ENTITY_HEADING(self.get_ped())
        local pedForwardX = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
        local pedForwardY = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
        local myGroup = PED.GET_PED_GROUP_INDEX(self.get_ped())
        if not PED.DOES_GROUP_EXIST(myGroup) then
          myGroup = PED.CREATE_GROUP(0)
        end
        while not STREAMING.HAS_MODEL_LOADED(npcData.hash) do
          STREAMING.REQUEST_MODEL(npcData.hash)
          coroutine.yield()
        end
        npc = PED.CREATE_PED(npcData.group, npcData.hash, 0.0, 0.0, 0.0, 0.0, true, false)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(npc, pedCoords.x + pedForwardX * 1.4, pedCoords.y + pedForwardY * 1.4,
          pedCoords.z, true, false, false)
        ENTITY.SET_ENTITY_HEADING(npc, pedHeading - 180)
        PED.SET_PED_AS_GROUP_MEMBER(npc, myGroup)
        PED.SET_PED_NEVER_LEAVES_GROUP(npc, true)
        npcBlip = HUD.ADD_BLIP_FOR_ENTITY(npc)
        HUD.SET_BLIP_AS_FRIENDLY(npcBlip, true)
        HUD.SET_BLIP_SCALE(npcBlip, 0.8)
        HUD.SHOW_HEADING_INDICATOR_ON_BLIP(npcBlip, true)
        HUD.SET_BLIP_SPRITE(npcBlip, 280)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(npc, pedCoords.x + pedForwardX * 1.4, pedCoords.y + pedForwardY * 1.4,
          pedCoords.z, true, false, false)
        ENTITY.SET_ENTITY_HEADING(npc, pedHeading - 180)
        WEAPON.GIVE_WEAPON_TO_PED(npc, 350597077, 9999, false, true)
        PED.SET_GROUP_FORMATION(myGroup, 2)
        PED.SET_GROUP_FORMATION_SPACING(myGroup, 1.0, 1.0, 1.0)
        PED.SET_PED_CONFIG_FLAG(npc, 179, true)
        PED.SET_PED_CONFIG_FLAG(npc, 294, true)
        PED.SET_PED_CONFIG_FLAG(npc, 398, true)
        PED.SET_PED_CONFIG_FLAG(npc, 401, true)
        PED.SET_PED_CONFIG_FLAG(npc, 443, true)
        PED.SET_PED_COMBAT_ABILITY(npc, 3)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 2, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 3, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 5, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 13, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 20, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 21, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 22, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 27, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 28, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 31, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 34, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 41, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 42, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 46, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 50, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 58, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 61, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(npc, 71, true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(npc, true)
        if npc_godMode then
          ENTITY.SET_ENTITY_INVINCIBLE(npc, true)
        end
        table.insert(spawned_npcs, npc)
      end)
    end
    ImGui.SameLine()
    if ImGui.Button(translateLabel("generic_delete") .. "##scenarios") then
      UI.widgetSound("Delete")
      script.run_in_fiber(function()
        for k, v in ipairs(spawned_npcs) do
          if ENTITY.DOES_ENTITY_EXIST(v) then
            PED.REMOVE_PED_FROM_GROUP(v)
            ENTITY.DELETE_ENTITY(v)
          end
          table.remove(spawned_npcs, k)
        end
      end)
    end
    ImGui.SameLine()
    if ImGui.Button(translateLabel("generic_play_btn") .. "##npc_scenarios") then
      if spawned_npcs[1] ~= nil then
        UI.widgetSound("Select")
        script.run_in_fiber(function(npcsc)
          for _, npc in ipairs(spawned_npcs) do
            if PED.IS_PED_ON_FOOT(npc) then
              if is_playing_anim then
                cleanupNPC(npcsc)
                is_playing_anim = false
              end
              playScenario(data, npc)
              is_playing_scenario = true
            else
              gui.show_error("Samurai's Scripts", "Scenarios can not be played inside vehicles.")
            end
          end
        end)
      else
        UI.widgetSound("Error")
      end
    end
    ImGui.SameLine()
    if ImGui.Button(translateLabel("generic_stop_btn") .. "##npc_scenarios") then
      if is_playing_scenario then
        UI.widgetSound("Cancel")
        script.run_in_fiber(function(stp)
          for _, npc in ipairs(spawned_npcs) do
            stopScenario(npc, stp)
            is_playing_scenario = false
          end
        end)
      end
    end
    ImGui.EndTabItem()
  end
  if ImGui.BeginTabItem(translateLabel("favs_tab")) then
    if favorite_actions[1] ~= nil then
      ImGui.PushItemWidth(420)
      displayFavoriteActions()
      ImGui.PopItemWidth()
      local selected_favorite = filteredFavs[fav_actions_index + 1]
      ImGui.Spacing()
      if ImGui.Button(translateLabel("generic_play_btn") .. "##favs") then
        UI.widgetSound("Select")
        if selected_favorite.dict ~= nil then -- animation type
          script.run_in_fier(function(pf)
            local coords     = self.get_pos()
            local heading    = Game.getHeading(self.get_ped())
            local forwardX   = Game.getForwardX(self.get_ped())
            local forwardY   = Game.getForwardY(self.get_ped())
            local boneIndex  = PED.GET_PED_BONE_INDEX(self.get_ped(), selected_favorite.boneID)
            local bonecoords = PED.GET_PED_BONE_COORDS(self.get_ped(), selected_favorite.boneID, 0.0, 0.0, 0.0)
            if lua_Fn.str_contains(selected_favorite.name, "DJ") then
              if not is_playing_radio and not anim_music then
                play_music("start", "RADIO_22_DLC_BATTLE_MIX1_RADIO")
                anim_music = true
              end
            else
              if anim_music then
                play_music("stop")
                anim_music = false
              end
            end
            playAnim(selected_favorite, self.get_ped(), selected_favorite.flag, selfprop1, selfprop2, selfloopedFX,
              selfSexPed, boneIndex, coords, heading, forwardX, forwardY, bonecoords, "self", plyrProps, selfPTFX, pf
            )
            curr_playing_anim = selected_favorite
            is_playing_anim   = true
          end)
        elseif selected_favorite.scenario ~= nil then -- scenario type
          playScenario(selected_favorite, self.get_ped())
          is_playing_scenario = true
        end
        addActionToRecents(selected_favorite)
      end
      ImGui.SameLine(); ImGui.Dummy(40, 1); ImGui.SameLine()
      if ImGui.Button(translateLabel("generic_stop_btn") .. "##favs") then
        UI.widgetSound("Cancel")
        script.run_in_fiber(function(fav)
          if is_playing_anim then
            cleanup(fav)
            is_playing_anim = false
            if anim_music then
              play_music("stop")
              anim_music = false
            end
          elseif is_playing_scenario then
            stopScenario(self.get_ped(), fav)
            is_playing_scenario = false
          end
        end)
      end
      ImGui.SameLine(); ImGui.Dummy(37, 1); ImGui.SameLine()
      if UI.coloredButton(translateLabel("remove_from_favs") .. "##favorites", "#FF0000", "#B30000", "#FF8080", 1) then
        UI.widgetSound("Delete")
        for k, v in ipairs(favorite_actions) do
          if v == selected_favorite then
            table.remove(favorite_actions, k)
          end
        end
        lua_cfg.save("favorite_actions", favorite_actions)
      end
    else
      ImGui.Dummy(1, 5)
      UI.wrappedText(translateLabel("favs_nil_txt"), 20)
    end
    ImGui.EndTabItem()
  end
  if ImGui.BeginTabItem(translateLabel("recents_tab")) then
    if recently_played_a[1] ~= nil then
      ImGui.PushItemWidth(420)
      displayRecentlyPlayed()
      ImGui.PopItemWidth()
      local selected_recent = filteredRecents[recents_index + 1]
      if ImGui.Button(translateLabel("generic_play_btn") .. "##recents") then
        UI.widgetSound("Select")
        if selected_recent.dict ~= nil then -- animation type
          script.run_in_fiber(function(pr)
            local coords     = self.get_pos()
            local heading    = Game.getHeading(self.get_ped())
            local forwardX   = Game.getForwardX(self.get_ped())
            local forwardY   = Game.getForwardY(self.get_ped())
            local boneIndex  = PED.GET_PED_BONE_INDEX(self.get_ped(), selected_recent.boneID)
            local bonecoords = PED.GET_PED_BONE_COORDS(self.get_ped(), selected_recent.boneID, 0.0, 0.0, 0.0)
            if lua_Fn.str_contains(selected_recent.name, "DJ") then
              if not is_playing_radio and not anim_music then
                play_music("start", "RADIO_22_DLC_BATTLE_MIX1_RADIO")
                anim_music = true
              end
            else
              if anim_music then
                play_music("stop")
                anim_music = false
              end
            end
            playAnim(selected_recent, self.get_ped(), selected_recent.flag, selfprop1, selfprop2, selfloopedFX, selfSexPed,
              boneIndex, coords, heading, forwardX, forwardY, bonecoords, "self", plyrProps, selfPTFX, pr
            )
            curr_playing_anim = selected_recent
            is_playing_anim   = true
          end)
        elseif selected_recent.scenario ~= nil then -- scenario type
          playScenario(selected_recent, self.get_ped())
          is_playing_scenario = true
        end
      end
      ImGui.SameLine(); ImGui.Dummy(40, 1); ImGui.SameLine()
      if ImGui.Button(translateLabel("generic_stop_btn") .. "##recents") then
        UI.widgetSound("Cancel")
        script.run_in_fiber(function(recent)
          if is_playing_anim then
            cleanup(recent)
            is_playing_anim = false
            if anim_music then
              play_music("stop")
              anim_music = false
            end
          elseif is_playing_scenario then
            stopScenario(self.get_ped(), recent)
            is_playing_scenario = false
          end
        end)
      end
    else
      ImGui.Dummy(1, 5); UI.wrappedText(translateLabel("recents_nil_txt"), 20)
    end
    ImGui.EndTabItem()
  end
  ImGui.EndTabBar()
end)


--[[
    *weapon*
]]
weapon_tab = Samurais_scripts:add_tab(translateLabel("weaponTab"))
weapon_tab:add_imgui(function()
  HashGrabber, HgUsed = ImGui.Checkbox(translateLabel("hashgrabberCB"), HashGrabber)
  UI.helpMarker(false,
    translateLabel("hashgrabber_tt"))
  if HgUsed then
    UI.widgetSound("Nav2")
  end

  Triggerbot, TbUsed = ImGui.Checkbox(translateLabel("triggerbotCB"), Triggerbot)
  UI.helpMarker(false,
    translateLabel("triggerbot_tt"))
  if Triggerbot then
    ImGui.SameLine(); aimEnemy, aimEnemyUsed = ImGui.Checkbox(translateLabel("enemyonlyCB"), aimEnemy)
    if aimEnemyUsed then
      lua_cfg.save("aimEnemy", aimEnemy)
      UI.widgetSound("Nav2")
    end
  end
  if TbUsed then
    lua_cfg.save("Triggerbot", Triggerbot)
    UI.widgetSound("Nav2")
  end

  autoKill, autoKillUsed = ImGui.Checkbox(translateLabel("autokillCB"), autoKill)
  UI.helpMarker(false, translateLabel("autokill_tt"))
  if autoKillUsed then
    lua_cfg.save("autoKill", autoKill)
    UI.widgetSound("Nav2")
  end

  runaway, runawayUsed = ImGui.Checkbox(translateLabel("runawayCB"), runaway)
  UI.helpMarker(false, translateLabel("runaway_tt"))
  if runawayUsed then
    lua_cfg.save("runaway", runaway)
    UI.widgetSound("Nav2")
    if runaway then
      publicEnemy = false
    end
  end

  replace_pool_q, rpqUsed = ImGui.Checkbox(translateLabel("katanaCB"), replace_pool_q)
  UI.helpMarker(false, translateLabel("katana_tt"))
  if rpqUsed then
    lua_cfg.save("replace_pool_q", replace_pool_q)
    UI.widgetSound("Nav2")
  end

  laserSight, laserSightUSed = ImGui.Checkbox(translateLabel("laserSightCB"), laserSight)
  UI.helpMarker(false, translateLabel("laserSight_tt"))
  if laserSightUSed then
    lua_cfg.save("laserSight", laserSight)
    UI.widgetSound("Nav2")
  end
  if laserSight then
    ImGui.Text(translateLabel("laserChoice_txt"))
    ImGui.SameLine(); laser_switch, lsrswUsed = ImGui.RadioButton("Red", laser_switch, 0)
    ImGui.SameLine(); laser_switch, lsrswUsed_2 = ImGui.RadioButton("Green", laser_switch, 1)
    if lsrswUsed then
      UI.widgetSound("Nav")
      lua_cfg.save("laser_switch", laser_switch)
      lua_cfg.save("laser_choice", laser_choice)
    end
    if lsrswUsed_2 then
      UI.widgetSound("Nav")
      lua_cfg.save("laser_switch", laser_switch)
      lua_cfg.save("laser_choice", laser_choice)
    end
    if laser_switch == 0 then
      laser_choice = "proj_laser_enemy"
    else
      laser_choice = "proj_laser_player"
    end
  end
end)

sound_player = self_tab:add_tab(translateLabel "soundplayer")
function displayMaleSounds()
  filteredMaleSounds = {}
  for _, v in ipairs(male_sounds_T) do
    table.insert(filteredMaleSounds, v.name)
  end
  sound_index1, used = ImGui.Combo("##maleSounds", sound_index1, filteredMaleSounds, #male_sounds_T)
end

function displayFemaleSounds()
  filteredFemaleSounds = {}
  for _, v in ipairs(female_sounds_T) do
    table.insert(filteredFemaleSounds, v.name)
  end
  sound_index2, used = ImGui.Combo("##femaleSounds", sound_index2, filteredFemaleSounds, #female_sounds_T)
end

function displayRadioStations()
  filteredRadios = {}
  for _, v in ipairs(radio_stations) do
    table.insert(filteredRadios, v.name)
  end
  radio_index, used = ImGui.Combo("##radioStations", radio_index, filteredRadios, #radio_stations)
end

sound_player:add_imgui(function()
  ImGui.Spacing(); ImGui.SeparatorText("Human Sounds"); ImGui.Spacing()
  ImGui.Dummy(20, 1); ImGui.SameLine(); sound_switch, isChanged = ImGui.RadioButton(translateLabel("malesounds"),
    sound_switch, 0); ImGui.SameLine()
  if isChanged then
    UI.widgetSound("Nav")
  end
  ImGui.Dummy(20, 1); ImGui.SameLine(); sound_switch, isChanged = ImGui.RadioButton(translateLabel("femalesounds"),
    sound_switch, 1)
  if isChanged then
    UI.widgetSound("Nav")
  end
  ImGui.Spacing()
  if sound_switch == 0 then
    ImGui.PushItemWidth(280)
    displayMaleSounds()
    ImGui.PopItemWidth()
    selected_sound = male_sounds_T[sound_index1 + 1]
  else
    ImGui.PushItemWidth(280)
    displayFemaleSounds()
    ImGui.PopItemWidth()
    selected_sound = female_sounds_T[sound_index2 + 1]
  end
  ImGui.SameLine(); ImGui.Spacing(); ImGui.SameLine()
  if sound_btn_off then
    ImGui.BeginDisabled()
    ImGui.Button(" " .. loading_label .. " ", 60, 30)
    ImGui.EndDisabled()
  else
    if ImGui.Button(" " .. translateLabel("generic_play_btn") .. " ##sound") then
      script.run_in_fiber(function(playsnd)
        local myCoords = Game.getCoords(self.get_ped(), true)
        AUDIO.PLAY_AMBIENT_SPEECH_FROM_POSITION_NATIVE(selected_sound.soundName, selected_sound.soundRef, myCoords.x,
          myCoords.y, myCoords.z, "SPEECH_PARAMS_FORCE")
        sound_btn_off = true
        start_loading_anim = true
        playsnd:sleep(5000)
        sound_btn_off = false
        start_loading_anim = false
      end)
    end
  end

  ImGui.Dummy(1, 10); ImGui.SeparatorText("Radio Stations")
  UI.toolTip(false, translateLabel("radioStations_tt"))
  ImGui.Spacing()
  ImGui.PushItemWidth(280)
  displayRadioStations()
  ImGui.PopItemWidth()
  selected_radio = radio_stations[radio_index + 1]
  if not radio_btn_off then
    ImGui.SameLine(); ImGui.Spacing(); ImGui.SameLine()
    if not is_playing_radio then
      if ImGui.Button(" " .. translateLabel("generic_play_btn") .. " ##radio") then
        script.run_in_fiber(function(rad)
          if not is_playing_anim then
            play_music("start", selected_radio.station)
            is_playing_radio   = true
            radio_btn_off      = true
            start_loading_anim = true
            rad:sleep(3000)
            radio_btn_off      = false
            start_loading_anim = false
          else
            gui.show_error("Samurais Scripts", "This option is disabled while playing animations to prevent bugs.")
          end
        end)
      end
    else
      if ImGui.Button(" " .. translateLabel("generic_stop_btn") .. " ##radio") then
        script.run_in_fiber(function(rad)
          play_music("stop")
          is_playing_radio   = false
          radio_btn_off      = true
          start_loading_anim = true
          rad:sleep(1500)
          radio_btn_off      = false
          start_loading_anim = false
        end)
      end
    end
  else
    ImGui.SameLine(); ImGui.Spacing(); ImGui.SameLine()
    ImGui.BeginDisabled()
    ImGui.Button(" " .. loading_label .. " ", 60, 30)
    ImGui.EndDisabled()
  end
end)


--[[
    *vehicle*
]]
vehicle_tab = Samurais_scripts:add_tab(translateLabel("vehicleTab"))

local popsnd, sndRef
local flame_size
local function filterVehNames()
  filteredNames = {}
  for _, veh in ipairs(gta_vehicles_T) do
    if VEHICLE.IS_THIS_MODEL_A_CAR(joaat(veh)) or VEHICLE.IS_THIS_MODEL_A_BIKE(joaat(veh)) or VEHICLE.IS_THIS_MODEL_A_QUADBIKE(joaat(veh)) then
      valid_veh = veh
      if string.find(string.lower(valid_veh), string.lower(search_term)) then
        table.insert(filteredNames, valid_veh)
      end
    end
  end
end

local function displayVehNames()
  filterVehNames()
  local vehNames = {}
  for _, veh in ipairs(filteredNames) do
    local vehName = vehicles.get_vehicle_display_name(joaat(veh))
    if string.find(string.lower(veh), "drift") then
      vehName = vehName .. "(Drift)"
    end
    table.insert(vehNames, vehName)
  end
  vehSound_index, used = ImGui.ListBox("##Vehicle Names", vehSound_index, vehNames, #filteredNames)
end

local function resetLastVehState(s)
  if ENTITY.DOES_ENTITY_EXIST(las_vehicle) then
    AUDIO.SET_VEHICLE_RADIO_LOUD(last_vehicle, false)
    if not has_custom_tires then
      VEHICLE.TOGGLE_VEHICLE_MOD(current_vehicle, 20, false)
    end
    if default_tire_smoke.r ~= driftSmoke_T.r or default_tire_smoke.g ~= driftSmoke_T.g or default_tire_smoke.b ~= driftSmoke_T.b then
      VEHICLE.SET_VEHICLE_TYRE_SMOKE_COLOR(current_vehicle, default_tire_smoke.r, default_tire_smoke.g,
        default_tire_smoke.b)
    end
    if default_handling_flags ~= nil then
      SS.resetHandlingFlags(last_vehicle, default_handling_flags)
      engine_brake_disabled  = false
      traction_ctrl_disabled = false
      kers_boost_enabled     = false
      offroader_enabled      = false
      rally_tires_enabled    = false
      easy_wheelie_enabled   = false
    end
    s:sleep(200)
    last_vehicle = current_vehicle
  else
    loud_radio_enabled     = false
    engine_brake_disabled  = false
    traction_ctrl_disabled = false
    kers_boost_enabled     = false
    offroader_enabled      = false
    rally_tires_enabled    = false
    easy_wheelie_enabled   = false
    last_vehicle           = current_vehicle
  end
end

local function onVehEnter(s)
  current_vehicle = self.get_veh()
  if Game.Self.isDriving() and current_vehicle ~= last_vehicle then
    resetLastVehState(s)
  end
  return current_vehicle
end

local function shoot_flares(s)
  if Game.requestWeaponAsset(0x47757124) then
    for _, bone in pairs(plane_bones_T) do
      local bone_idx  = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(self.get_veh(), bone)
      local jet_fwd_X = ENTITY.GET_ENTITY_FORWARD_X(self.get_veh())
      local jet_fwd_Y = ENTITY.GET_ENTITY_FORWARD_Y(self.get_veh())
      if bone_idx ~= -1 then
        local bone_pos = ENTITY.GET_ENTITY_BONE_POSTION(self.get_veh(), bone_idx)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(
          ((bone_pos.x + 0.01) + (jet_fwd_X / 1.13)), ((bone_pos.y + 0.01) + jet_fwd_Y / 1.13), bone_pos.z,
          ((bone_pos.x - 0.01) - (jet_fwd_X / 1.13)), ((bone_pos.y - 0.01) - jet_fwd_Y / 1.13), bone_pos.z + 0.06,
          1.0, false, 0x47757124, self.get_ped(), true, false, 100.0
        )
        AUDIO.PLAY_SOUND_FRONTEND(-1, "HIT_OUT", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true)
        s:sleep(250)
      end
    end
  end
end

vehicle_tab:add_imgui(function()
  if current_vehicle ~= nil and current_vehicle ~= 0 then
    local manufacturer  = Game.Vehicle.manufacturer(current_vehicle)
    local vehicle_name  = Game.Vehicle.name(current_vehicle)
    local full_veh_name = manufacturer .. " " .. vehicle_name
    local vehicle_class = Game.Vehicle.class(current_vehicle)
    ImGui.SeparatorText(full_veh_name .. "   (" .. vehicle_class .. ")")
  else
    ImGui.SeparatorText("On Foot")
  end
  ImGui.Spacing(); limitVehOptions, lvoUsed = ImGui.Checkbox(translateLabel("lvoCB"), limitVehOptions)
  UI.toolTip(false, translateLabel("lvo_tt"))
  if lvoUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("limitVehOptions", limitVehOptions)
  end

  ImGui.SameLine(); ImGui.Dummy(7, 1); ImGui.SameLine();
  missiledefense, mdefUsed = ImGui.Checkbox("Missile Defense", missiledefense)
  UI.toolTip(false, translateLabel("missile_def_tt"))
  if mdefUsed then
    lua_cfg.save("missiledefense", missiledefense)
    if missiledefense then
      UI.widgetSound("Radar")
      gui.show_success("Samurais Scripts", translateLabel("missile_def_on_notif"))
    else
      UI.widgetSound("Delete")
      gui.show_message("Samurais Scripts", translateLabel("missile_def_off_notif"))
    end
  end

  launchCtrl, lctrlUsed = ImGui.Checkbox("Launch Control", launchCtrl)
  UI.toolTip(false, translateLabel("lct_tt"))
  if lctrlUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("launchCtrl", launchCtrl)
  end

  ImGui.SameLine(); ImGui.Dummy(31, 1); ImGui.SameLine(); speedBoost, spdbstUsed = ImGui.Checkbox("NOS", speedBoost)
  UI.toolTip(false, translateLabel("speedBoost_tt"))
  if spdbstUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("speedBoost", speedBoost)
  end
  if speedBoost then
    ImGui.SameLine()
    if ImGui.Button("NOS Settings") then
      UI.widgetSound("Select")
      ImGui.OpenPopup("Nos Settings")
    end
    ImGui.SetNextWindowPos(780, 400, ImGuiCond.Appearing)
    ImGui.SetNextWindowBgAlpha(0.9)
    ImGui.SetNextWindowSize(450, 260)
    if ImGui.BeginPopupModal("Nos Settings", ImGuiWindowFlags.AlwaysAutoResize | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.NoTitleBar) then
      ImGui.Spacing(); ImGui.Text("NOS Settings"); ImGui.SameLine(); ImGui.Dummy(256, 1); ImGui.SameLine()
      ImGui.PushStyleVar(ImGuiStyleVar.FrameRounding, 80)
      if ImGui.Button("  X  ##nos_settings") then
        UI.widgetSound("Cancel")
        ImGui.CloseCurrentPopup()
      end
      ImGui.PopStyleVar(); ImGui.Separator(); ImGui.Dummy(1, 10)
      nosAudio, nosaudioUsed = ImGui.Checkbox("NOS Sound", nosAudio)
      UI.toolTip(false, translateLabel("nos_sound_tt"))
      if nosaudioUsed then
        UI.widgetSound("Nav2")
        lua_cfg.save("nosAudio", nosAudio)
      end

      ImGui.SameLine(); nosFlames, nosflamesUsed = ImGui.Checkbox("NOS Flames", nosFlames)
      UI.toolTip(false, translateLabel("flames_tt"))
      if nosflamesUsed then
        UI.widgetSound("Nav2")
        lua_cfg.save("nosFlames", nosFlames)
      end

      ImGui.SameLine(); nosvfx, nosvfxUsed = ImGui.Checkbox("Screen Effect", nosvfx)
      UI.toolTip(false, translateLabel("vfx_tt"))
      if nosvfxUsed then
        UI.widgetSound("Nav2")
        lua_cfg.save("nosvfx", nosvfx)
      end

      ImGui.Dummy(1, 15); ImGui.Text(" Power:  "); ImGui.SameLine()
      nosPower, nspwrUsed = ImGui.SliderInt("##nospower", nosPower, 10, 100, "%d",
        ImGuiSliderFlags.NoInput | ImGuiSliderFlags.AlwaysClamp | ImGuiSliderFlags.Logarithmic)
      if nspwrUsed then
        UI.widgetSound("Nav")
      end
      ImGui.Dummy(1, 20)
      if ImGui.Button("  " .. translateLabel("saveBtn") .. "  ##nos_settings") then
        UI.widgetSound("Select")
        lua_cfg.save("nosPower", nosPower)
        ImGui.CloseCurrentPopup()
      end
      ImGui.SameLine(); ImGui.Dummy(30, 1); ImGui.SameLine()
      if ImGui.Button("  " .. translateLabel("generic_cancel_btn") .. "  ##nos_settings") then
        UI.widgetSound("Cancel")
        ImGui.CloseCurrentPopup()
      end
      ImGui.End()
    end
  end

  loud_radio, loudRadioUsed = ImGui.Checkbox("Big Subwoofer", loud_radio)
  UI.toolTip(false, translateLabel("loudradio_tt"))
  if loudRadioUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("loud_radio", loud_radio)
    if not loud_radio then
      script.run_in_fiber(function()
        AUDIO.SET_VEHICLE_RADIO_LOUD(current_vehicle, false)
        loud_radio_enabled = false
      end)
    end
  end

  ImGui.SameLine(); ImGui.Dummy(32, 1); ImGui.SameLine(); nosPurge, nosPurgeUsed = ImGui.Checkbox("NOS Purge", nosPurge)
  UI.toolTip(false, translateLabel("purge_tt"))
  if nosPurgeUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("nosPurge", nosPurge)
  end

  popsNbangs, pnbUsed = ImGui.Checkbox("Pops & Bangs", popsNbangs)
  UI.toolTip(false, translateLabel("pnb_tt"))
  if pnbUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("popsNbangs", popsNbangs)
  end
  if popsNbangs then
    ImGui.SameLine(); ImGui.Dummy(37, 1); ImGui.SameLine(); louderPops, louderPopsUsed = ImGui.Checkbox("Louder Pops",
      louderPops)
    UI.toolTip(false, translateLabel("louderpnb_tt"))
    if louderPopsUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("louderPops", louderPops)
    end
  end

  hornLight, hornLightUsed = ImGui.Checkbox("High Beams on Horn", hornLight)
  UI.toolTip(false, translateLabel("highbeams_tt"))
  if hornLightUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("hornLight", hornLight)
  end

  ImGui.SameLine(); autobrklight, autobrkUsed = ImGui.Checkbox("Auto Brake Lights", autobrklight)
  UI.toolTip(false, translateLabel("brakeLight_tt"))
  if autobrkUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("autobrklight", autobrklight)
  end

  holdF, holdFused = ImGui.Checkbox("Keep Engine On", holdF)
  UI.toolTip(false, translateLabel("engineOn_tt"))
  if holdFused then
    UI.widgetSound("Nav2")
    lua_cfg.save("holdF", holdF)
  end

  ImGui.SameLine(); ImGui.Dummy(25, 1); ImGui.SameLine(); keepWheelsTurned, kwtrnd = ImGui.Checkbox(
    "Keep Wheels Turned", keepWheelsTurned)
  UI.toolTip(false, translateLabel("wheelsturned_tt"))
  if kwtrnd then
    UI.widgetSound("Nav2")
    lua_cfg.save("keepWheelsTurned", keepWheelsTurned)
  end

  noJacking, noJackingUsed = ImGui.Checkbox(
    "Can't Touch This!", noJacking)
  UI.toolTip(false, translateLabel("canttouchthis_tt"))
  if noJackingUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("noJacking", noJacking)
  end

  ImGui.SameLine(); ImGui.Dummy(15, 1); ImGui.SameLine(); insta180, insta180Used = ImGui.Checkbox("Instant 180°",
    insta180)
  if insta180Used then
    UI.widgetSound("Nav2")
    lua_cfg.save("insta180", insta180)
  end
  UI.toolTip(false, translateLabel("insta180_tt"))

  if Game.isOnline() then
    flares_forall, flaresUsed = ImGui.Checkbox("Flares For All", flares_forall)
    UI.toolTip(false, translateLabel("flaresforall_tt"))
    if flaresUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("flares_forall", flares_forall)
    end
  else
    ImGui.BeginDisabled()
    flares_forall, flaresUsed = ImGui.Checkbox("Flares For All", flares_forall)
    ImGui.EndDisabled()
    UI.toolTip(true, translateLabel("Unavailable in Single Player"), '#FF3333', 1)
  end

  ImGui.SameLine(); ImGui.Dummy(46, 1); ImGui.SameLine(); real_plane_speed, rpsUsed = ImGui.Checkbox(
    "Higher Plane Speeds", real_plane_speed)
  UI.toolTip(false, translateLabel("planeSpeed_tt"))
  if rpsUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("real_plane_speed", real_plane_speed)
  end

  unbreakableWindows, ubwUsed = ImGui.Checkbox("Strong Windows", unbreakableWindows)
  UI.toolTip(false, translateLabel("strongWindows_tt"))
  if ubwUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("unbreakableWindows", unbreakableWindows)
    if not unbreakableWindows and ubwindowsToggled then
      VEHICLE.SET_DONT_PROCESS_VEHICLE_GLASS(current_vehicle, false)
      ubwindowsToggled = false
    end
  end

  ImGui.SameLine(); ImGui.Dummy(18, 1); ImGui.SameLine(); flappyDoors, flappyDoorsUsed = ImGui.Checkbox("Flappy Doors",
    flappyDoors)
  if flappyDoorsUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("flappyDoors", flappyDoors)
  end

  veh_mines, vmnsUsed = ImGui.Checkbox("Vehicle Mines", veh_mines)
  if vmnsUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("veh_mines", veh_mines)
  end
  UI.toolTip(false, translateLabel("veh_mines_tt"))
  if veh_mines then
    ImGui.SameLine(); ImGui.Dummy(35, 1); ImGui.SameLine();
    if ImGui.Button(translateLabel("mine_type_btn")) then
      UI.widgetSound("Select")
      ImGui.OpenPopup("Mine Types")
    end
    ImGui.SetNextWindowPos(760, 400, ImGuiCond.Appearing)
    ImGui.SetNextWindowBgAlpha(0.81)
    if ImGui.BeginPopupModal("Mine Types", true, ImGuiWindowFlags.AlwaysAutoResize) then
      ImGui.Dummy(1, 5); ImGui.Text(translateLabel("mine_type_txt")); ImGui.Dummy(1, 5)
      vmine_type.spikes, spikeUsed = ImGui.Checkbox("Spike", vmine_type.spikes)
      if spikeUsed then
        UI.widgetSound("Nav2")
        vmine_type.slick     = false
        vmine_type.explosive = false
        vmine_type.emp       = false
        vmine_type.kinetic   = false
        lua_cfg.save("vmine_type", vmine_type)
      end

      ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine()
      vmine_type.slick, slickUsed = ImGui.Checkbox("Slick", vmine_type.slick)
      if slickUsed then
        UI.widgetSound("Nav2")
        vmine_type.spikes    = false
        vmine_type.explosive = false
        vmine_type.emp       = false
        vmine_type.kinetic   = false
        lua_cfg.save("vmine_type", vmine_type)
      end

      ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine()
      vmine_type.explosive, expUsed = ImGui.Checkbox("Explosive", vmine_type.explosive)
      if expUsed then
        UI.widgetSound("Nav2")
        vmine_type.spikes  = false
        vmine_type.slick   = false
        vmine_type.emp     = false
        vmine_type.kinetic = false
        lua_cfg.save("vmine_type", vmine_type)
      end

      ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine()
      vmine_type.emp, empUsed = ImGui.Checkbox("EMP", vmine_type.emp)
      if empUsed then
        UI.widgetSound("Nav2")
        vmine_type.spikes    = false
        vmine_type.slick     = false
        vmine_type.explosive = false
        vmine_type.kinetic   = false
        lua_cfg.save("vmine_type", vmine_type)
      end

      ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine()
      vmine_type.kinetic, kntcUsed = ImGui.Checkbox("Kinetic", vmine_type.kinetic)
      if kntcUsed then
        UI.widgetSound("Nav2")
        vmine_type.spikes    = false
        vmine_type.slick     = false
        vmine_type.explosive = false
        vmine_type.emp       = false
        lua_cfg.save("vmine_type", vmine_type)
      end

      ImGui.Dummy(1, 5)
      if missiledefense and (vmine_type.slick or vmine_type.explosive or vmine_type.emp or vmine_type.kinetic) then
        UI.coloredText(
          "[ ! ] NOTE: You have 'Missile Defense' activated which will automatically destroy / remove these mines. If you still want to use them, please disable 'Missile Defense'.",
          "yellow", 0.69, 30)
      end
      ImGui.Dummy(1, 5)
      if vmine_type.spikes or vmine_type.slick or vmine_type.explosive or vmine_type.emp or vmine_type.kinetic then
        if ImGui.Button("Confirm") then
          UI.widgetSound("Select")
          lua_cfg.save("vmine_type", vmine_type)
          ImGui.CloseCurrentPopup()
        end
      end
      ImGui.End()
    end
  end

  ImGui.Dummy(1, 5); rgbLights, rgbToggled = ImGui.Checkbox(translateLabel("rgbLights"), rgbLights)
  if rgbToggled then
    UI.widgetSound("Nav2")
    lua_cfg.save("rgbLights", rgbLights)
    if rgbLights then
      script.run_in_fiber(function(rgbhl)
        if not VEHICLE.IS_TOGGLE_MOD_ON(current_vehicle, 22) then
          has_xenon = false
        else
          has_xenon    = true
          defaultXenon = VEHICLE.GET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle)
        end
        rgbhl:sleep(200)
        start_rgb_loop = true
      end)
    else
      start_rgb_loop = false
    end
  end
  if rgbLights then
    ImGui.SameLine(); ImGui.Dummy(5, 1); ImGui.SameLine()
    ImGui.PushItemWidth(150)
    lightSpeed, lightSpeedUsed = ImGui.SliderInt(translateLabel("rgbSlider"), lightSpeed, 1, 3)
    ImGui.PopItemWidth()
    if lightSpeedUsed then
      UI.widgetSound("Nav")
      lua_cfg.save("lightSpeed", lightSpeed)
    end
  end

  ImGui.Spacing(); ImGui.SeparatorText("Auto-Pilot")
  if current_vehicle ~= nil and current_vehicle ~= 0 then
    local aircraft_check = Game.Self.isDriving() and (is_plane or is_heli)
    ImGui.BeginDisabled(not aircraft_check)
    if ImGui.Button(" Fly To Waypoint ") then
      UI.widgetSound("Select")
      script.run_in_fiber(function(ap)
        local wp = HUD.GET_FIRST_BLIP_INFO_ID(HUD.GET_WAYPOINT_BLIP_ENUM_ID())
        if HUD.DOES_BLIP_EXIST(wp) then
          local waypoint_coords = HUD.GET_BLIP_COORDS(wp)
          if autopilot_objective or autopilot_random then
            TASK.CLEAR_PED_TASKS(self.get_ped())
            TASK.CLEAR_PRIMARY_VEHICLE_TASK(current_vehicle)
          end
          autopilot_waypoint  = true
          autopilot_objective = false
          autopilot_random    = false
          gui.show_success("Samurai's Scripts", "Flying towards your waypoint")
          if is_plane then
            TASK.TASK_PLANE_MISSION(
              self.get_ped(), current_vehicle, 0, 0, waypoint_coords.x, waypoint_coords.y, waypoint_coords.z + 600,
              4, 100.0, 0, 90, 0, 0, true
            )
            if VEHICLE.GET_VEHICLE_HAS_LANDING_GEAR(current_vehicle) and VEHICLE.IS_PLANE_LANDING_GEAR_INTACT(current_vehicle) then
              if VEHICLE.GET_LANDING_GEAR_STATE(current_vehicle) ~= 4 then
                if Game.Self.get_elevation() >= 15 then
                  VEHICLE.CONTROL_LANDING_GEAR(current_vehicle, 1)
                else
                  repeat
                    ap:sleep(10)
                  until Game.Self.get_elevation() >= 15
                  VEHICLE.CONTROL_LANDING_GEAR(current_vehicle, 1)
                end
              end
            end
          elseif is_heli then
            TASK.TASK_HELI_MISSION(
              self.get_ped(), current_vehicle, 0, 0, waypoint_coords.x, waypoint_coords.y, waypoint_coords.z,
              4, 50.0, 4.0, -1, -1, 100, 100.0, 0
            )
          end
        else
          gui.show_warning("Samurai's Scripts", "Please set a waypoint on the map first!")
        end
      end)
    end
    ImGui.SameLine()
    if ImGui.Button(" Fly To Objective ") then
      UI.widgetSound("Select")
      script.run_in_fiber(function(ap)
        local objective_coords
        for _, id in ipairs(objectives_T) do
          local blip = HUD.GET_CLOSEST_BLIP_INFO_ID(id)
          if HUD.DOES_BLIP_EXIST(blip) then
            objective_coords = HUD.GET_BLIP_COORDS(blip)
            break
          end
        end
        if objective_coords ~= nil then
          if autopilot_waypoint or autopilot_random then
            TASK.CLEAR_PED_TASKS(self.get_ped())
            TASK.CLEAR_PRIMARY_VEHICLE_TASK(current_vehicle)
          end
          autopilot_waypoint  = false
          autopilot_objective = true
          autopilot_random    = false
          gui.show_success("Samurai's Scripts", "Flying towards objective")
          if is_plane then
            TASK.TASK_PLANE_MISSION(
              self.get_ped(), current_vehicle, 0, 0, objective_coords.x, objective_coords.y, objective_coords.z + 600,
              4, 100.0, 0, 90, 0, 0, true
            )
            if VEHICLE.GET_VEHICLE_HAS_LANDING_GEAR(current_vehicle) and VEHICLE.IS_PLANE_LANDING_GEAR_INTACT(current_vehicle) then
              if VEHICLE.GET_LANDING_GEAR_STATE(current_vehicle) ~= 4 then
                if Game.Self.get_elevation() >= 15 then
                  VEHICLE.CONTROL_LANDING_GEAR(current_vehicle, 1)
                else
                  repeat
                    ap:sleep(10)
                  until Game.Self.get_elevation() >= 15
                  VEHICLE.CONTROL_LANDING_GEAR(current_vehicle, 1)
                end
              end
            end
          elseif is_heli then
            TASK.TASK_HELI_MISSION(
              self.get_ped(), current_vehicle, 0, 0, objective_coords.x, objective_coords.y, objective_coords.z,
              4, 50.0, 4.0, -1, -1, 100, 100.0, 0
            )
          end
        else
          gui.show_warning("Samurai's Scripts", "No objective found!")
        end
      end)
    end
    ImGui.SameLine()
    if ImGui.Button(" Random ") then
      UI.widgetSound("Select")
      script.run_in_fiber(function(ap)
        if autopilot_waypoint or autopilot_objective then
          TASK.CLEAR_PED_TASKS(self.get_ped())
          TASK.CLEAR_PRIMARY_VEHICLE_TASK(current_vehicle)
        end
        autopilot_waypoint  = false
        autopilot_objective = false
        autopilot_random    = true
        gui.show_success("Samurai's Scripts", "Flying towards some random coordinates")
        if is_plane then
          TASK.TASK_PLANE_MISSION(
            self.get_ped(), current_vehicle, 0, 0, math.random(-3000, 3000), math.random(-3000, 3000),
            math.random(400, 900), 4, 100.0, 0, 90, 0, 0, true
          )
          if VEHICLE.GET_VEHICLE_HAS_LANDING_GEAR(current_vehicle) and VEHICLE.IS_PLANE_LANDING_GEAR_INTACT(current_vehicle) then
            if VEHICLE.GET_LANDING_GEAR_STATE(current_vehicle) ~= 4 then
              if Game.Self.get_elevation() >= 15 then
                VEHICLE.CONTROL_LANDING_GEAR(current_vehicle, 1)
              else
                repeat
                  ap:sleep(10)
                until Game.Self.get_elevation() >= 15
                VEHICLE.CONTROL_LANDING_GEAR(current_vehicle, 1)
              end
            end
          end
        elseif is_heli then
          TASK.TASK_HELI_MISSION(
            self.get_ped(), current_vehicle, 0, 0, math.random(-3000, 3000), math.random(-3000, 3000),
            math.random(10, 300),
            4, 50.0, 4.0, -1, -1, 100, 100.0, 0
          )
        end
      end)
    end
    if autopilot_waypoint or autopilot_objective or autopilot_random then
      ImGui.Dummy(160, 1); ImGui.SameLine()
      if ImGui.Button("Stop", 60, 35) then
        UI.widgetSound("Cancel")
        script.run_in_fiber(function()
          TASK.CLEAR_PED_TASKS(self.get_ped())
          TASK.CLEAR_PRIMARY_VEHICLE_TASK(current_vehicle)
          autopilot_waypoint  = false
          autopilot_objective = false
          autopilot_random    = false
        end)
      end
    end
    ImGui.EndDisabled()
    if not aircraft_check then
      UI.coloredText(translateLabel("autopilot_err_txt"), 'yellow', 0.87, 20)
    end
  else
    UI.coloredText(translateLabel("autopilot_err_txt"), 'yellow', 0.87, 20)
  end
  ImGui.Dummy(1, 5); ImGui.SeparatorText("MISC")
  ImGui.BeginDisabled(current_vehicle == 0)
  if ImGui.Button(" " .. translateLabel("engineSoundBtn") .. " ") then
    if is_car or is_bike or is_quad then
      UI.widgetSound("Select")
      open_sounds_window = true
    else
      open_sounds_window = false
      UI.widgetSound("Error")
      gui.show_error("Samurais Scripts", translateLabel("engineSoundErr"))
    end
  end

  ImGui.SameLine(); ImGui.Dummy(30, 1); ImGui.SameLine()
  if dummyCopCar == 0 then
    if VEHICLE.GET_VEHICLE_CLASS(current_vehicle) ~= 18 then
      if ImGui.Button(" Equip Fake Siren ") then
        if is_car or is_bike and not PED.IS_PED_IN_FLYING_VEHICLE(self.get_ped()) then
          UI.widgetSound("Select")
          dummyCop()
        else
          UI.widgetSound("Error")
          gui.show_error("Samurais Scripts", "This feature is only available for cars and bikes.")
        end
      end
      if not Game.isOnline() then
        UI.toolTip(false, "The siren audio only works Online.")
      end
    else
      ImGui.BeginDisabled()
      ImGui.Button("Equip Fake Siren")
      ImGui.EndDisabled()
      UI.toolTip(false, "Your vehicle has a real siren. You don't need a fake one.")
    end
  else
    if ImGui.Button("Remove Fake Siren") then
      UI.widgetSound("Cancel")
      script.run_in_fiber(function(deletecop)
        VEHICLE.SET_VEHICLE_ACT_AS_IF_HAS_SIREN_ON(current_vehicle, false)
        VEHICLE.SET_VEHICLE_CAUSES_SWERVING(current_vehicle, false)
        VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(current_vehicle, 0, false)
        VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(current_vehicle, 1, false)
        if ENTITY.DOES_ENTITY_EXIST(dummyCopCar) then
          ENTITY.SET_ENTITY_AS_MISSION_ENTITY(dummyCopCar, true, true)
          deletecop:sleep(200)
          ENTITY.DELETE_ENTITY(dummyCopCar)
        end
        dummyCopCar = 0
      end)
    end
  end

  if ImGui.Button("Ejecto Seato Cuz") then
    UI.widgetSound("Select")
    script.run_in_fiber(function(ejecto)
      local passengers = Game.Vehicle.getOccupants(current_vehicle)
      if #passengers == 1 then
        if passengers[1] == self.get_ped() then
          gui.show_error("Samurai's Scripts", "You can not ejecto seato on yourself, cuz!")
          goto pass
        end
      elseif #passengers >= 1 then
        gui.show_message("Samurai's Scripts", "YEET!")
      end
      for _, ped in ipairs(passengers) do
        if ped ~= self.get_ped() then
          if not PED.IS_PED_A_PLAYER(ped) then
            TASK.CLEAR_PED_TASKS(ped)
            TASK.TASK_LEAVE_VEHICLE(ped, current_vehicle, 4160)
          else
            local player_index = NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(ped)
            command.call("vehkick", { player_index })
            ejecto:sleep(1000)
            if PED.IS_PED_SITTING_IN_VEHICLE(ped, current_vehicle) then -- player wasn't ejected. Try something else maybe?
              --[[
              does jack shit. -_-
              if entities.take_control_of(current_vehicle, 250) then
                VEHICLE.SET_VEHICLE_CAN_EJECT_PASSENGERS_IF_LOCKED(current_vehicle, true)
                VEHICLE.SET_VEHICLE_RESPECTS_LOCKS_WHEN_HAS_DRIVER(current_vehicle, true)
                VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(current_vehicle, player_index, true)
                ejecto:sleep(500)
                VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(current_vehicle, player_index, false)
              end
              --]]
              gui.show_error("Samurai's Scripts", "Failed to eject the player from our vehicle!")
            end
          end
        end
      end
      ::pass::
    end)
  end
  UI.toolTip(false, translateLabel("ejecto_seato_tt"))

  if current_vehicle ~= 0 then
    local engineHealth = VEHICLE.GET_VEHICLE_ENGINE_HEALTH(current_vehicle)
    if engineHealth <= 300 then
      engineDestroyed = true
    else
      engineDestroyed = false
    end
  end
  if engineDestroyed then
    engineButton_label = translateLabel("Fix Engine")
    engine_hp          = 1000
    button_color_1     = "#008000"
    button_color_2     = "#005A00"
    button_color_3     = "#BFFFBF"
  else
    engineButton_label = translateLabel("Destroy Engine")
    engine_hp          = -4000
    button_color_1     = "#FF0000"
    button_color_2     = "#B30000"
    button_color_3     = "#FF8080"
  end
  ImGui.SameLine(); ImGui.Dummy(97, 1); ImGui.SameLine()
  if UI.coloredButton(engineButton_label, button_color_1, button_color_2, button_color_3, 1) then
    UI.widgetSound("Select")
    script.run_in_fiber(function()
      VEHICLE.SET_VEHICLE_ENGINE_HEALTH(current_vehicle, engine_hp)
    end)
  end
  ImGui.EndDisabled()

  ImGui.BeginDisabled(Game.Self.isDriving() or not Game.Self.isOutside() or current_vehicle == 0)
  if ImGui.Button("TP Into Last Vehicle") then
    UI.widgetSound("Select")
    script.run_in_fiber(function()
      if ENTITY.DOES_ENTITY_EXIST(current_vehicle) and ENTITY.IS_ENTITY_A_VEHICLE(current_vehicle) then
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(self.get_ped())
        PED.SET_PED_INTO_VEHICLE(self.get_ped(), current_vehicle, -1)
      else
        gui.show_error("Samurai's Scripts", "Your last vehicle no longer exists in the game world.")
      end
    end)
  end
  ImGui.SameLine(); ImGui.Dummy(55, 1); ImGui.SameLine()
  if ImGui.Button("Bring Last Vehicle") then
    UI.widgetSound("Select")
    script.run_in_fiber(function(blv)
      if ENTITY.DOES_ENTITY_EXIST(current_vehicle) and ENTITY.IS_ENTITY_A_VEHICLE(current_vehicle) then
        local veh_coords  = ENTITY.GET_ENTITY_COORDS(current_vehicle, true)
        local self_coords = self.get_pos()
        local distance    = MISC.GET_DISTANCE_BETWEEN_COORDS(veh_coords.x, veh_coords.y, veh_coords.z, self_coords.x,
          self_coords.y, self_coords.z, false)
        if distance <= 15 then
          gui.show_warning("Samurai's Scripts", "Your last vehicle is already too close")
        else
          local self_fwd   = ENTITY.GET_ENTITY_FORWARD_VECTOR(self.get_ped())
          local veh_hash   = ENTITY.GET_ENTITY_MODEL(current_vehicle)
          local vmin, vmax = Game.getModelDimensions(veh_hash, blv)
          local veh_length = vmax.y - vmin.y
          local tp_offset  = { x = self_fwd.x * veh_length, y = self_fwd.y * veh_length }
          ENTITY.SET_ENTITY_COORDS(current_vehicle, self_coords.x + tp_offset.x, self_coords.y + tp_offset.y,
            self_coords.z, false, false, false, true)
        end
      else
        gui.show_error("Samurai's Scripts", "Your last vehicle no longer exists in the game world.")
      end
    end)
  end
  ImGui.EndDisabled()
  if Game.isOnline() then
    if globals.get_int(1572056) > 0 and current_vehicle ~= globals.get_int(1572056) then
      ImGui.BeginDisabled(Game.Self.isDriving() or not Game.Self.isOutside() or globals.get_int(1572056) <= 0)
      if ImGui.Button("TP Into Personal Vehicle") then
        UI.widgetSound("Select")
        script.run_in_fiber(function()
          if ENTITY.DOES_ENTITY_EXIST(globals.get_int(1572056)) then
            if INTERIOR.GET_INTERIOR_FROM_ENTITY(globals.get_int(1572056)) == 0 then
              TASK.CLEAR_PED_TASKS_IMMEDIATELY(self.get_ped())
              PED.SET_PED_INTO_VEHICLE(self.get_ped(), globals.get_int(1572056), -1)
            else
              gui.show_error("Samurai's Scripts", "Your personal vehicle is not outside.")
            end
          else
            gui.show_error("Samurai's Scripts", "Your personal vehicle no longer exists in the game world.")
          end
        end)
      end
      ImGui.SameLine()
      if ImGui.Button("Bring Personal Vehicle") then
        UI.widgetSound("Select")
        script.run_in_fiber(function(bpv)
          if ENTITY.DOES_ENTITY_EXIST(globals.get_int(1572056)) then
            if INTERIOR.GET_INTERIOR_FROM_ENTITY(globals.get_int(1572056)) == 0 then
              local veh_coords  = ENTITY.GET_ENTITY_COORDS(globals.get_int(1572056), true)
              local self_coords = self.get_pos()
              local distance    = MISC.GET_DISTANCE_BETWEEN_COORDS(veh_coords.x, veh_coords.y, veh_coords.z, self_coords.x,
                self_coords.y, self_coords.z, false)
              if distance <= 15 then
                gui.show_warning("Samurai's Scripts", "Your personal vehicle is already too close")
              else
                local self_fwd   = ENTITY.GET_ENTITY_FORWARD_VECTOR(self.get_ped())
                local veh_hash   = ENTITY.GET_ENTITY_MODEL(globals.get_int(1572056))
                local vmin, vmax = Game.getModelDimensions(veh_hash, bpv)
                local veh_length = vmax.y - vmin.y
                local tp_offset  = { x = self_fwd.x * veh_length, y = self_fwd.y * veh_length }
                ENTITY.SET_ENTITY_COORDS(globals.get_int(1572056), self_coords.x + tp_offset.x, self_coords.y + tp_offset
                  .y, self_coords.z, false, false, false, true)
              end
            else
              gui.show_error("Samurai's Scripts", "Your personal vehicle is not outside.")
            end
          else
            gui.show_error("Samurai's Scripts", "Your personal vehicle no longer exists in the game world.")
          end
        end)
      end
      ImGui.EndDisabled()
    end
  end

  if open_sounds_window then
    ImGui.SetNextWindowPos(740, 300, ImGuiCond.Appearing)
    ImGui.SetNextWindowSizeConstraints(100, 100, 600, 800)
    ImGui.Begin("Vehicle Sounds",
      ImGuiWindowFlags.AlwaysAutoResize | ImGuiWindowFlags.NoTitleBar | ImGuiWindowFlags.NoCollapse)
    if ImGui.Button(translateLabel("closeBtn")) then
      UI.widgetSound("Cancel")
      open_sounds_window = false
    end
    ImGui.Spacing(); ImGui.Spacing()
    ImGui.PushItemWidth(250)
    search_term, used = ImGui.InputTextWithHint("", translateLabel("searchVeh_hint"), search_term, 32)
    if ImGui.IsItemActive() then
      is_typing = true
    else
      is_typing = false
    end
    ImGui.PushItemWidth(270)
    displayVehNames()
    ImGui.PopItemWidth()
    local selected_name = filteredNames[vehSound_index + 1]
    ImGui.Spacing()
    if ImGui.Button(translateLabel("Use This Sound")) then
      UI.widgetSound("Select")
      script.run_in_fiber(function()
        AUDIO.FORCE_USE_AUDIO_GAME_OBJECT(current_vehicle, selected_name)
      end)
    end
    ImGui.SameLine()
    if ImGui.Button(translateLabel("Restore Default")) then
      UI.widgetSound("Delete")
      script.run_in_fiber(function()
        AUDIO.FORCE_USE_AUDIO_GAME_OBJECT(current_vehicle,
          vehicles.get_vehicle_display_name(ENTITY.GET_ENTITY_MODEL(current_vehicle)))
      end)
    end
    ImGui.End()
  end
end)

drift_mode_tab = vehicle_tab:add_tab("Drift Mode")
drift_mode_tab:add_imgui(function()
  if Game.Self.isDriving() then
    local manufacturer  = Game.Vehicle.manufacturer(current_vehicle)
    local vehicle_name  = Game.Vehicle.name(current_vehicle)
    local full_veh_name = manufacturer .. " " .. vehicle_name
    local vehicle_class = Game.Vehicle.class(current_vehicle)
    ImGui.Spacing()
    if validModel then
      ImGui.SeparatorText(full_veh_name .. "   (" .. vehicle_class .. ")")
      driftMode, driftModeUsed = ImGui.Checkbox(translateLabel("driftModeCB"), driftMode)
      UI.helpMarker(false, translateLabel("driftMode_tt"))
      if driftModeUsed then
        UI.widgetSound("Nav2")
        lua_cfg.save("driftMode", driftMode)
        lua_cfg.save("DriftTires", false)
      end
      if driftMode then
        DriftTires = false
        ImGui.SameLine()
        ImGui.PushItemWidth(160)
        DriftIntensity, DriftIntensityUsed = ImGui.SliderInt("##Intensity", DriftIntensity, 0, 3)
        ImGui.PopItemWidth()
        UI.toolTip(false, translateLabel("driftSlider_tt"))
        if DriftIntensityUsed then
          UI.widgetSound("Nav")
          lua_cfg.save("DriftIntensity", DriftIntensity)
        end
      end

      DriftTires, DriftTiresUsed = ImGui.Checkbox(translateLabel("driftTiresCB"), DriftTires)
      UI.helpMarker(false, translateLabel("driftTires_tt"))
      if DriftTires then
        driftMode = false
      end
      if DriftTiresUsed then
        UI.widgetSound("Nav2")
        lua_cfg.save("DriftTires", DriftTires)
        lua_cfg.save("driftMode", false)
      end

      if driftMode or DriftTires then
        ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine()
        ImGui.PushItemWidth(160)
        DriftPowerIncrease, dpiUsed = ImGui.SliderInt("Torque", DriftPowerIncrease, 10, 100); ImGui.PopItemWidth()
        UI.toolTip(false, translateLabel("driftToruqe_tt"))
        if dpiUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("DriftPowerIncrease", DriftPowerIncrease)
        end

        ImGui.Spacing(); DriftSmoke, dsmkUsed = ImGui.Checkbox("Drift Smoke", DriftSmoke)
        UI.toolTip(false, translateLabel("DriftSmoke_tt"))
        if dsmkUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("DriftSmoke", DriftSmoke)
          if not BurnoutSmoke and not DriftSmoke then
            script.run_in_fiber(function()
              if not has_custom_tires then
                VEHICLE.TOGGLE_VEHICLE_MOD(current_vehicle, 20, false)
              end
              if default_tire_smoke.r ~= driftSmoke_T.r or default_tire_smoke.g ~= driftSmoke_T.g or default_tire_smoke.b ~= driftSmoke_T.b then
                VEHICLE.SET_VEHICLE_TYRE_SMOKE_COLOR(current_vehicle, default_tire_smoke.r, default_tire_smoke.g,
                  default_tire_smoke.b)
              end
            end)
          end
        end
      end

      BurnoutSmoke, bsmkUsed = ImGui.Checkbox("Burnout Smoke", BurnoutSmoke)
      -- UI.toolTip(false, translateLabel("BurnoutSmoke_tt"))
      if bsmkUsed then
        UI.widgetSound("Nav2")
        lua_cfg.save("BurnoutSmoke", BurnoutSmoke)
        if not BurnoutSmoke and not DriftSmoke then
          script.run_in_fiber(function()
            if not has_custom_tires then
              VEHICLE.TOGGLE_VEHICLE_MOD(current_vehicle, 20, false)
            end
            if default_tire_smoke.r ~= driftSmoke_T.r or default_tire_smoke.g ~= driftSmoke_T.g or default_tire_smoke.b ~= driftSmoke_T.b then
              log.info('true')
              VEHICLE.SET_VEHICLE_TYRE_SMOKE_COLOR(current_vehicle, default_tire_smoke.r, default_tire_smoke.g,
                default_tire_smoke.b)
            end
          end)
        end
      end
      if DriftSmoke or BurnoutSmoke then
        ImGui.Spacing(); UI.coloredText(translateLabel("driftSmokeCol"), { driftSmoke_T.r, driftSmoke_T.g, driftSmoke_T
            .b }, 1, 35)
        if not customSmokeCol then
          driftSmokeIndex, dsiUsed = ImGui.Combo("##tireSmoke", driftSmokeIndex, driftSmokeColors, #driftSmokeColors)
          ImGui.SameLine()
          if dsiUsed then
            lua_cfg.save("driftSmokeIndex", driftSmokeIndex)
            selected_smoke_col = driftSmokeColors[driftSmokeIndex + 1]
            local r, g, b = UI.getColor(string.lower(selected_smoke_col))
            r, g, b = lua_Fn.round((r * 255), 2), lua_Fn.round((g * 255), 2), lua_Fn.round((b * 255), 2)
            driftSmoke_T.r, driftSmoke_T.g, driftSmoke_T.b = r, g, b
            lua_cfg.save("driftSmoke_T", driftSmoke_T)
            script.run_in_fiber(function()
              if not custom_tires_checked then
                has_custom_tires = VEHICLE.IS_TOGGLE_MOD_ON(current_vehicle, 20)
                custom_tires_checked = true
              end
              if has_custom_tires and not tire_smoke_col_checked then
                default_tire_smoke.r, default_tire_smoke.g, default_tire_smoke.b = VEHICLE.GET_VEHICLE_TYRE_SMOKE_COLOR(
                  current_vehicle, default_tire_smoke.r, default_tire_smoke.g, default_tire_smoke.b)
                tire_smoke_col_checked = true
              end
            end)
          end
        else
          local hex_len
          if smokeHex:find("^#") then
            hex_len = 8
          else
            hex_len = 7
          end
          smokeHex, smokeHexEntered = ImGui.InputTextWithHint("##customHex", "HEX", smokeHex, hex_len,
            ImGuiInputTextFlags.EnterReturnsTrue | ImGuiInputTextFlags.CharsNoBlank |
            ImGuiInputTextFlags.CharsHexadecimal | ImGuiInputTextFlags.CharsUppercase); ImGui.SameLine()
          if ImGui.IsItemActive() then
            is_typing = true
          else
            is_typing = false
          end
          UI.toolTip(false, translateLabel("hex_tt"))
          if smokeHexEntered then
            if smokeHex ~= nil then
              if not smokeHex:find("^#") then
                smokeHex = "#" .. smokeHex
              end
              if smokeHex:len() > 1 then
                if smokeHex:len() ~= 4 and smokeHex:len() ~= 7 then
                  UI.widgetSound("Error")
                  gui.show_warning("Samurais Scripts",
                    string.format(
                      "' %s ' is not a valid HEX color code. Please enter either a short or a long HEX string.", smokeHex))
                else
                  UI.widgetSound("Select")
                  driftSmoke_T.r, driftSmoke_T.g, driftSmoke_T.b = lua_Fn.hexToRGB(smokeHex)
                  lua_cfg.save("driftSmoke_T", driftSmoke_T)
                  script.run_in_fiber(function()
                    if not custom_tires_checked then
                      has_custom_tires = VEHICLE.IS_TOGGLE_MOD_ON(current_vehicle, 20)
                      custom_tires_checked = true
                    end
                    if has_custom_tires and not tire_smoke_col_checked then
                      default_tire_smoke.r, default_tire_smoke.g, default_tire_smoke.b = VEHICLE
                          .GET_VEHICLE_TYRE_SMOKE_COLOR(
                            current_vehicle, default_tire_smoke.r, default_tire_smoke.g, default_tire_smoke.b)
                      tire_smoke_col_checked = true
                    end
                  end)
                  gui.show_success("Samurais Scripts", "Drift smoke color changed")
                end
              else
                UI.widgetSound("Error")
                gui.show_warning("Samurais Scripts", "Please enter a valid HEX color code.")
              end
            end
          end
        end
        customSmokeCol, cscUsed = ImGui.Checkbox(translateLabel("customLangTxt"), customSmokeCol)
        if cscUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("customSmokeCol", customSmokeCol)
          if not customSmokeCol then
            selected_smoke_col = driftSmokeColors[driftSmokeIndex + 1]
            local r, g, b = UI.getColor(string.lower(selected_smoke_col))
            r, g, b = lua_Fn.round((r * 255), 2), lua_Fn.round((g * 255), 2), lua_Fn.round((b * 255), 2)
            driftSmoke_T.r, driftSmoke_T.g, driftSmoke_T.b = r, g, b
            lua_cfg.save("driftSmoke_T", driftSmoke_T)
          end
        end
      end

      if driftMode or DriftTires then
        ImGui.Dummy(1, 10); ImGui.SeparatorText("[Experimental]")
        ImGui.Spacing(); driftMinigame, drmgUsed = ImGui.Checkbox("Drift Minigame", driftMinigame)
        UI.toolTip(false, translateLabel("DriftGame_tt"))
        if drmgUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("driftMinigame", driftMinigame)
        end
        if driftMinigame then
          ImGui.Dummy(1, 10)
          UI.coloredText("Your Highest Score: ", 'yellow', 0.92, 20); ImGui.SameLine(); ImGui.Text(lua_Fn.separateInt(
            driftPB) .. " Points")
        end
      end
    else
      UI.wrappedText(translateLabel("driftInvalidVehTxt"), 15)
    end
  else
    ImGui.Text(translateLabel("getinveh"))
  end
end)

flatbed       = vehicle_tab:add_tab("Flatbed")
towed_vehicle = 0
tow_xAxis     = 0.0
tow_yAxis     = 0.0
tow_zAxis     = 0.0
modelOverride = false
flatbed:add_imgui(function()
  local window_size_x, window_size_y = ImGui.GetWindowSize()
  local vehicleHandles               = entities.get_all_vehicles_as_handles()
  local flatbedModel                 = 1353720154
  local vehicle_model                = Game.getEntityModel(current_vehicle)
  local playerPosition               = self.get_pos()
  local flatbedPosition              = ENTITY.GET_ENTITY_COORDS(current_vehicle, true)
  local flatbedForwardX              = Game.getForwardX(current_vehicle)
  local flatbedForwardY              = Game.getForwardY(current_vehicle)
  for _, veh in ipairs(vehicleHandles) do
    script.run_in_fiber(function(detector)
      local detectPos = vec3:new(flatbedPosition.x - (flatbedForwardX * 10), flatbedPosition.y - (flatbedForwardY * 10),
        flatbedPosition.z)
      local vehPos    = ENTITY.GET_ENTITY_COORDS(veh, false)
      local vDist     = SYSTEM.VDIST(detectPos.x, detectPos.y, detectPos.z, vehPos.x, vehPos.y, vehPos.z)
      if vDist <= 5 then
        closestVehicle = veh
      else
        detector:sleep(50)
        closestVehicle = nil
        return
      end
    end)
  end
  local closestVehicleModel = 0
  if closestVehicle ~= nil then
    closestVehicleModel = Game.getEntityModel(closestVehicle)
  end
  local iscar              = VEHICLE.IS_THIS_MODEL_A_CAR(closestVehicleModel)
  local isbike             = VEHICLE.IS_THIS_MODEL_A_BIKE(closestVehicleModel)
  local closestVehicleName = vehicles.get_vehicle_display_name(closestVehicleModel)
  if vehicle_model == flatbedModel then
    is_in_flatbed = true
  else
    is_in_flatbed = false
  end
  if closestVehicleName == "" then
    displayText = translateLabel("fltbd_nonearbyvehTxt")
  elseif tostring(closestVehicleName) == "Flatbed" then
    displayText = translateLabel("fltbd_nootherfltbdTxt")
  else
    displayText = (translateLabel("fltbd_closest_veh") .. tostring(closestVehicleName))
  end
  if towed_vehicle ~= 0 then
    displayText = translateLabel("fltbd_towingTxt") ..
        vehicles.get_vehicle_display_name(ENTITY.GET_ENTITY_MODEL(towed_vehicle)) .. "."
  end
  if modelOverride then
    towable = true
  else
    towable = false
  end
  if iscar then
    towable = true
  end
  if isbike then
    towable = true
  end
  if closestVehicleModel == 745926877 then --Buzzard
    towable = true
  end
  if is_in_flatbed then
    ImGui.Dummy(1, 10); ImGui.SeparatorText(displayText)
    ImGui.Dummy(1, 10);
    ImGui.BeginDisabled(not Game.Self.isDriving() or towed_vehicle ~= 0)
    towPos, towPosUsed = ImGui.Checkbox(translateLabel("Show Towing Position"), towPos)
    ImGui.EndDisabled()
    UI.helpMarker(false, translateLabel("towpos_tt"))
    if towPosUsed then
      UI.widgetSound("Nav2")
    end

    towEverything, towEverythingUsed = ImGui.Checkbox(translateLabel("Tow Everything"), towEverything)
    UI.helpMarker(false, translateLabel("TowEverything_tt"))
    if towEverythingUsed then
      UI.widgetSound("Nav2")
      lua_cfg.save("towEverything", towEverything)
    end
    if towEverything then
      modelOverride = true
    else
      modelOverride = false
    end

    ImGui.Dummy(1, 10); ImGui.Dummy((window_size_x // 2) - 65, 1); ImGui.SameLine()
    if towed_vehicle == 0 then
      if ImGui.Button(translateLabel("towBtn"), 80, 40) then
        UI.widgetSound("Select")
        if towable and closestVehicle ~= nil and closestVehicleModel ~= flatbedModel then
          script.run_in_fiber(function()
            if entities.take_control_of(closestVehicle, 300) then
              flatbedHeading     = ENTITY.GET_ENTITY_HEADING(current_vehicle)
              flatbedBone        = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, "chassis_dummy")
              vehBone            = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(closestVehicle, "chassis_dummy")
              local vehicleClass = VEHICLE.GET_VEHICLE_CLASS(closestVehicle)
              if vehicleClass == 1 then
                tow_zAxis = 0.9
                tow_yAxis = -2.3
              elseif vehicleClass == 2 then
                tow_zAxis = 0.993
                tow_yAxis = -2.17046
              elseif vehicleClass == 6 then
                tow_zAxis = 1.00069420
                tow_yAxis = -2.17046
              elseif vehicleClass == 7 then
                tow_zAxis = 1.009
                tow_yAxis = -2.17036
              elseif vehicleClass == 15 then
                tow_zAxis = 1.3
                tow_yAxis = -2.21069
              elseif vehicleClass == 16 then
                tow_zAxis = 1.5
                tow_yAxis = -2.21069
              else
                tow_zAxis = 1.1
                tow_yAxis = -2.0
              end
              ENTITY.SET_ENTITY_HEADING(closestVehicleModel, flatbedHeading)
              ENTITY.ATTACH_ENTITY_TO_ENTITY(closestVehicle, current_vehicle, flatbedBone, tow_xAxis, tow_yAxis,
                tow_zAxis, 0.0, 0.0,
                0.0, true, true, false, false, 1, true, 1)
              towed_vehicle = closestVehicle
              ENTITY.SET_ENTITY_CANT_CAUSE_COLLISION_DAMAGED_ENTITY(towed_vehicle, current_vehicle)
            else
              gui.show_error("Samurais Scripts", translateLabel("failed_veh_ctrl"))
            end
          end)
        end
        if closestVehicle ~= nil and closestVehicleModel ~= flatbedModel and not towable then
          gui.show_message("Samurais Scripts", translateLabel("fltbd_carsOnlyTxt"))
        end
        if closestVehicle ~= nil and closestVehicleModel == flatbedModel then
          gui.show_message("Samurais Scripts", translateLabel("fltbd_nootherfltbdTxt"))
        end
      end
    else
      if ImGui.Button(translateLabel("detachBtn"), 80, 40) then
        UI.widgetSound("Select2")
        script.run_in_fiber(function()
          local modelHash         = ENTITY.GET_ENTITY_MODEL(towed_vehicle)
          local attachedVehicle   = ENTITY.GET_ENTITY_OF_TYPE_ATTACHED_TO_ENTITY(current_vehicle, modelHash)
          local attachedVehcoords = ENTITY.GET_ENTITY_COORDS(towed_vehicle, false)
          local controlled        = entities.take_control_of(attachedVehicle, 300)
          if ENTITY.DOES_ENTITY_EXIST(attachedVehicle) then
            if controlled then
              ENTITY.DETACH_ENTITY(attachedVehicle, true, true)
              ENTITY.SET_ENTITY_COORDS(attachedVehicle, attachedVehcoords.x - (flatbedForwardX * 10),
                attachedVehcoords.y - (flatbedForwardY * 10), flatbedPosition.z, false, false, false, false)
              VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(towed_vehicle, 5.0)
              towed_vehicle = 0
            end
          end
        end)
      end
      ImGui.Dummy(1, 5); ImGui.SeparatorText(translateLabel("Adjust Vehicle Position"))
      UI.toolTip(false, translateLabel("AdjustPosition_tt"))
      ImGui.Spacing(); ImGui.Dummy((window_size_x // 2) - 40, 1); ImGui.SameLine()
      ImGui.ArrowButton("##Up", 2)
      if ImGui.IsItemActive() then
        tow_zAxis = tow_zAxis + 0.01
        ENTITY.ATTACH_ENTITY_TO_ENTITY(towed_vehicle, current_vehicle, flatbedBone, tow_xAxis, tow_yAxis, tow_zAxis,
          0.0, 0.0, 0.0,
          true, true, false, false, 1, true, 1)
      end
      ImGui.Dummy((window_size_x // 2) - 80, 1); ImGui.SameLine()
      ImGui.ArrowButton("##Left", 0)
      if ImGui.IsItemActive() then
        tow_yAxis = tow_yAxis + 0.01
        ENTITY.ATTACH_ENTITY_TO_ENTITY(towed_vehicle, current_vehicle, flatbedBone, tow_xAxis, tow_yAxis, tow_zAxis,
          0.0, 0.0, 0.0,
          true, true, false, false, 1, true, 1)
      end
      ImGui.SameLine(); ImGui.Dummy(23, 1); ImGui.SameLine()
      ImGui.ArrowButton("##Right", 1)
      if ImGui.IsItemActive() then
        tow_yAxis = tow_yAxis - 0.01
        ENTITY.ATTACH_ENTITY_TO_ENTITY(towed_vehicle, current_vehicle, flatbedBone, tow_xAxis, tow_yAxis, tow_zAxis,
          0.0, 0.0, 0.0,
          true, true, false, false, 1, true, 1)
      end
      ImGui.Dummy((window_size_x // 2) - 40, 1); ImGui.SameLine()
      ImGui.ArrowButton("##Down", 3)
      if ImGui.IsItemActive() then
        tow_zAxis = tow_zAxis - 0.01
        ENTITY.ATTACH_ENTITY_TO_ENTITY(towed_vehicle, current_vehicle, flatbedBone, tow_xAxis, tow_yAxis, tow_zAxis,
          0.0, 0.0, 0.0,
          true, true, false, false, 1, true, 1)
      end
    end
  else
    UI.wrappedText(translateLabel("getinsidefltbd"), 20)
    if ImGui.Button(translateLabel("spawnfltbd")) then
      script.run_in_fiber(function(script)
        if not PED.IS_PED_SITTING_IN_ANY_VEHICLE(self.get_ped()) then
          if Game.Self.isOutside() then
            local try = 0
            while not STREAMING.HAS_MODEL_LOADED(flatbedModel) do
              STREAMING.REQUEST_MODEL(flatbedModel)
              script:yield()
              if try > 100 then
                return
              else
                try = try + 1
              end
            end
            fltbd = VEHICLE.CREATE_VEHICLE(flatbedModel, playerPosition.x, playerPosition.y, playerPosition.z,
              ENTITY.GET_ENTITY_HEADING(self.get_ped()), true, false, false)
            PED.SET_PED_INTO_VEHICLE(self.get_ped(), fltbd, -1)
            ENTITY.SET_ENTITY_AS_NO_LONGER_NEEDED(fltbd)
          else
            gui.show_error("Samurais Scripts", translateLabel("noSpawnInside"))
          end
        else
          gui.show_error("Samurais Scripts", translateLabel("Exit your current vehicle first."))
        end
      end)
    end
  end
end)

handling_tab = vehicle_tab:add_tab("Handling Editor")
handling_tab:add_imgui(function()
  ImGui.Spacing(); noEngineBraking, nebrUsed = ImGui.Checkbox("Disable Engine Braking", noEngineBraking)
  UI.toolTip(false, "Allows your vehicle to coast without losing so much speed when you're not accelerating.")
  if nebrUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("noEngineBraking", noEngineBraking)
  end

  -- ImGui.SameLine(); ImGui.Dummy(37, 1); ImGui.SameLine();
  kersBoost, kbUsed = ImGui.Checkbox("KERS Boost", kersBoost)
  UI.toolTip(false, "Equips your vehicle with KERS boost, similar to Open Wheel vehicles. Press [E] to use.")
  if kbUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("kersBoost", kersBoost)
  end

  offroaderx2, offroadrUsed = ImGui.Checkbox("Better Offroad Capabilities", offroaderx2)
  UI.toolTip(false, "Greatly improves your vehicle's offroad capabilities.")
  if offroadrUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("offroaderx2", offroaderx2)
  end

  -- ImGui.SameLine(); ImGui.Dummy(15, 1); ImGui.SameLine();
  rallyTires, rallytiresUsed = ImGui.Checkbox("Rally Tires", rallyTires)
  UI.toolTip(false, "Equips your vehicle with rally tires. Improves offroad traction.")
  if rallytiresUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("rallyTires", rallyTires)
  end

  noTractionCtrl, notcUsed = ImGui.Checkbox("Force No Traction Control", noTractionCtrl)
  UI.toolTip(false,
    "Forcibly disables your vehicle's traction control. This is mainly useful for morotrcycles because with this enabled, bikes will be able to drift :D")
  if notcUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("noTractionCtrl", noTractionCtrl)
  end

  -- ImGui.SameLine(); ImGui.Dummy(20, 1); ImGui.SameLine();
  easyWheelie, ezwUsed = ImGui.Checkbox("Easy Wheelie", easyWheelie)
  UI.toolTip(false, "Allows you to pop wheelies at very low speeds, just like the Manchez.")
  if ezwUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("easyWheelie", easyWheelie)
  end

  --[[
  ImGui.Spacing(); ImGui.SeparatorText("Steering")
  rwSteering, rwstrUsed = ImGui.Checkbox("Rear Wheels", rwSteering)
  UI.toolTip(false, "Your vehicle will use the rear wheels to steer instead of the front.")
  if rwstrUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("rwSteering", rwSteering)
  end

  ImGui.SameLine(); awSteering, awstrUsed = ImGui.Checkbox("All Wheels", awSteering)
  UI.toolTip(false, "Your vehicle will use all its wheels to steer.")
  if awstrUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("awSteering", awSteering)
  end

  ImGui.SameLine(); handbrakeSteering, hbstrUsed = ImGui.Checkbox("Handbrake Steering", handbrakeSteering)
  UI.toolTip(false, "When you press the handbrake, your vehicle will use all its wheels to steer, similar to monster trucks.")
  if hbstrUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("handbrakeSteering", handbrakeSteering)
  end

  ImGui.Spacing(); UI.wrappedText("[ ! ] NOTE: These options change your vehicle's steering behavior but you can not visually see the difference.", 25)
  ]]
end)

vehicle_creator   = vehicle_tab:add_tab("Vehicle Creator")
vCreator_searchQ  = ""
vehicleName       = ""
creation_name     = ""
main_vehicle_name = ""
veh_axisMult      = 1
vehicle_index     = 0
persist_index     = 0
spawned_veh_index = 0
vehicleHash       = 0
spawned_vehicle   = 0
main_vehicle      = 0
persist_switch    = 0
attachment_index  = 0
selected_attchmnt = 0
spawned_persist   = 0
veh_attach_X      = 0.0
veh_attach_Y      = 0.0
veh_attach_Z      = 0.0
veh_attach_RX     = 0.0
veh_attach_RY     = 0.0
veh_attach_RZ     = 0.0
spawned_vehicles  = {}
spawned_vehNames  = {}
filteredVehNames  = {}
persist_names     = {}
veh_attachments   = {}
attached_vehicles = { entity = 0, hash = 0, mods = {}, color_1 = { r = 0, g = 0, b = 0 }, color_2 = { r = 0, g = 0, b = 0 }, tint = 0, posx = 0.0, posy = 0.0, posz = 0.0, rotx = 0.0, roty = 0.0, rotz = 0.0 }
vehicle_creation  = { name = "", main_veh = 0, mods = {}, color_1 = { r = 0, g = 0, b = 0 }, color_2 = { r = 0, g = 0, b = 0 }, tint = 0, attachments = {} }
saved_vehicles    = lua_cfg.read("saved_vehicles")

local function listVehicles()
  vehicle_list   = {}
  local this_veh = {}
  for _, veh in ipairs(gta_vehicles_T) do
    local vehicle_hash = joaat(veh)
    local displayName  = vehicles.get_vehicle_display_name(veh)
    this_veh           = { hash = vehicle_hash, name = displayName }
    table.insert(vehicle_list, this_veh)
  end
end
local function updatefilteredVehicles()
  listVehicles()
  filtered_vehicles = {}
  for _, veh in ipairs(vehicle_list) do
    if string.find(string.lower(veh.name), string.lower(vCreator_searchQ)) then
      table.insert(filtered_vehicles, veh)
    end
  end
  table.sort(filtered_vehicles, function(a, b)
    return a.name < b.name
  end)
end

local function displayFilteredList()
  updatefilteredVehicles()
  vehicle_names = {}
  for _, veh in ipairs(filtered_vehicles) do
    local displayName = veh.name
    if string.find(string.lower(displayName), "drift") then
      displayName = displayName .. "  (Drift)"
    end
    table.insert(vehicle_names, displayName)
  end
  vehicle_index, _ = ImGui.ListBox("##vehList", vehicle_index, vehicle_names, #filtered_vehicles)
end

local function showAttachedVehicles()
  attachment_names = {}
  for _, veh in pairs(veh_attachments) do
    table.insert(attachment_names, veh.name)
  end
  attachment_index, _ = ImGui.Combo("##attached_vehs", attachment_index, attachment_names, #veh_attachments)
end

local function filterSavedVehicles()
  filteredCreations = {}
  if saved_vehicles[1] ~= nil then
    for _, t in pairs(saved_vehicles) do
      table.insert(filteredCreations, t)
    end
  end
end

local function showSavedVehicles()
  filterSavedVehicles()
  for _, veh in pairs(filteredCreations) do
    table.insert(persist_names, veh.name)
  end
  persist_index, _ = ImGui.ListBox("##persist_vehs", persist_index, persist_names, #filteredCreations)
end

local function appendVehicleMods(v, t)
  script.run_in_fiber(function()
    for i = 0, 49 do
      table.insert(t, VEHICLE.GET_VEHICLE_MOD(v, i))
    end
  end)
end

local function setVehicleMods(v, t)
  script.run_in_fiber(function()
    VEHICLE.SET_VEHICLE_MOD_KIT(v, 0)
    for slot, mod in pairs(t) do
      VEHICLE.SET_VEHICLE_MOD(v, (slot - 1), mod, true)
    end
  end)
end

---@param main integer
---@param mods table
---@param col_1 table
---@param col_2 table
---@param attachments table
local function spawnPersistVeh(main, mods, col_1, col_2, tint, attachments)
  script.run_in_fiber(function()
    local Pos      = self.get_pos()
    local forwardX = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
    local forwardY = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
    local heading  = ENTITY.GET_ENTITY_HEADING(self.get_ped())
    if Game.requestModel(main) then
      spawned_persist = VEHICLE.CREATE_VEHICLE(main, Pos.x + (forwardX * 7), Pos.y + (forwardY * 7), Pos.z, heading, true,
        false, false)
      VEHICLE.SET_VEHICLE_IS_STOLEN(spawned_persist, false)
      DECORATOR.DECOR_SET_INT(spawned_persist, "MPBitset", 0)
      VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(spawned_persist, col_1.r, col_1.g, col_1.b)
      VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(spawned_persist, col_2.r, col_2.g, col_2.b)
      setVehicleMods(spawned_persist, mods)
      VEHICLE.SET_VEHICLE_WINDOW_TINT(spawned_persist, tint)
    end
    for _, att in ipairs(attachments) do
      if Game.requestModel(att.hash) then
        local attach = VEHICLE.CREATE_VEHICLE(att.hash, Pos.x + (forwardX * 7), Pos.y + (forwardY * 7), Pos.z, heading,
          true, false, false)
        VEHICLE.SET_VEHICLE_IS_STOLEN(attach, false)
        DECORATOR.DECOR_SET_INT(attach, "MPBitset", 0)
        VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(attach, att.color_1.r, att.color_1.g, att.color_1.b)
        VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(attach, att.color_2.r, att.color_2.g, att.color_2.b)
        setVehicleMods(attach, att.mods)
        VEHICLE.SET_VEHICLE_WINDOW_TINT(attach, att.tint)
        if ENTITY.DOES_ENTITY_EXIST(spawned_persist) and ENTITY.DOES_ENTITY_EXIST(attach) then
          local Bone = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(spawned_persist, "chassis_dummy")
          ENTITY.ATTACH_ENTITY_TO_ENTITY(attach, spawned_persist, Bone, att.posx, att.posy, att.posz, att.rotx, att.roty,
            att.rotz, false, false, false, false, 2, true, 1)
        end
      end
    end
  end)
end

local function createWideBodyCivic()
  vehicle_creation = {
    name = "Widebody Civic",
    main_veh = 1074745671,
    mods = {},
    color_1 = { r = 0, g = 0, b = 0 },
    color_2 = { r = 0, g = 0, b = 0 },
    tint = 1,
    attachments = {
      {
        entity = 0,
        hash = 987469656,
        posx = 0.0,
        posy = -0.075,
        posz = 0.076,
        rotx = 0.0,
        roty = 0.0,
        rotz = 0.0,
        mods = { 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 3, 2, 2, -1, 4, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 },
        color_1 = { r = 0, g = 0, b = 0 },
        color_2 = { r = 0, g = 0, b = 0 },
        tint = 1,
      }
    }
  }
  table.insert(saved_vehicles, vehicle_creation)
  lua_cfg.save("saved_vehicles", saved_vehicles)
  vehicle_creation = {}
end

local function resetOnSave()
  vehicleName       = ""
  creation_name     = ""
  main_vehicle_name = ""
  veh_axisMult      = 1
  vehicle_index     = 0
  persist_index     = 0
  spawned_veh_index = 0
  vehicleHash       = 0
  spawned_vehicle   = 0
  main_vehicle      = 0
  attachment_index  = 0
  selected_attchmnt = 0
  veh_attach_X      = 0.0
  veh_attach_Y      = 0.0
  veh_attach_Z      = 0.0
  veh_attach_RX     = 0.0
  veh_attach_RY     = 0.0
  veh_attach_RZ     = 0.0
  spawned_vehicles  = {}
  spawned_vehNames  = {}
  filteredVehNames  = {}
  persist_names     = {}
  veh_attachments   = {}
  attachment_names  = {}
  attached_vehicles = {}
  vehicle_creation  = { name = "", main_veh = 0, mods = {}, color_1 = { r = 0, g = 0, b = 0 }, color_2 = { r = 0, g = 0, b = 0 }, tint = 0, attachments = {} }
end

vehicle_creator:add_imgui(function()
  ImGui.Dummy(1, 10)
  persist_switch, pswChanged = ImGui.RadioButton(translateLabel("Create"), persist_switch, 0)
  UI.helpMarker(false, translateLabel("vcreator_tt"))
  if pswChanged then
    UI.widgetSound("Nav")
  end
  if saved_vehicles[1] ~= nil then
    ImGui.SameLine(); ImGui.Dummy(40, 1); ImGui.SameLine(); persist_switch, pswChanged = ImGui.RadioButton(
      translateLabel("vc_saved_vehs"), persist_switch, 1)
    if pswChanged then
      UI.widgetSound("Nav")
    end
  else
    ImGui.BeginDisabled()
    ImGui.SameLine(); ImGui.Dummy(40, 1); ImGui.SameLine(); persist_switch, pswChanged = ImGui.RadioButton(
      translateLabel("vc_saved_vehs"), persist_switch, 1)
    ImGui.EndDisabled()
    UI.toolTip(false, translateLabel("vc_saved_vehs_tt"))
  end
  if persist_switch == 0 then
    ImGui.Spacing()
    ImGui.PushItemWidth(350)
    vCreator_searchQ, used = ImGui.InputTextWithHint("##searchVehicles", translateLabel("search_hint"), vCreator_searchQ,
      32)
    ImGui.PopItemWidth()
    if ImGui.IsItemActive() then
      is_typing = true
    else
      is_typing = false
    end
    ImGui.PushItemWidth(350)
    displayFilteredList()
    ImGui.PopItemWidth()
    ImGui.Separator()
    if filtered_vehicles[1] ~= nil then
      vehicleHash = filtered_vehicles[vehicle_index + 1].hash
      vehicleName = filtered_vehicles[vehicle_index + 1].name
    end
    if ImGui.Button("   " .. translateLabel("Spawn") .. "   ##vehcreator") then
      UI.widgetSound("Select")
      script.run_in_fiber(function()
        local plyrCoords   = self.get_pos()
        local plyrForwardX = Game.getForwardX(self.get_ped())
        local plyrForwardY = Game.getForwardY(self.get_ped())
        if Game.requestModel(vehicleHash) then
          spawned_vehicle = VEHICLE.CREATE_VEHICLE(vehicleHash, plyrCoords.x + (plyrForwardX * 5),
            plyrCoords.y + (plyrForwardY * 5), plyrCoords.z, (ENTITY.GET_ENTITY_HEADING(self.get_ped()) + 90), true,
            false, false)
          VEHICLE.SET_VEHICLE_IS_STOLEN(spawned_vehicle, false)
          DECORATOR.DECOR_SET_INT(spawned_vehicle, "MPBitset", 0)
          if main_vehicle == 0 then
            main_vehicle      = spawned_vehicle
            main_vehicle_name = vehicles.get_vehicle_display_name(ENTITY.GET_ENTITY_MODEL(main_vehicle))
          else
            table.insert(spawned_vehicles, spawned_vehicle)
            table.insert(spawned_vehNames, vehicleName)
            local dupes = lua_Fn.getTableDupes(spawned_vehNames, vehicleName)
            if dupes > 1 then
              newVehName = vehicleName .. " #" .. tostring(dupes)
              table.insert(filteredVehNames, newVehName)
            else
              table.insert(filteredVehNames, vehicleName)
            end
          end
        end
      end)
    end
    if saved_vehicles[1] == nil then
      ImGui.SameLine(); ImGui.Dummy(20, 1); ImGui.SameLine()
      if ImGui.Button(translateLabel("widebodycivic_Btn")) then
        UI.widgetSound("Select")
        createWideBodyCivic()
        spawnPersistVeh(saved_vehicles[1].main_veh, saved_vehicles[1].mods, saved_vehicles[1].color_1,
          saved_vehicles[1].color_2, saved_vehicles[1].tint, saved_vehicles[1].attachments)
      end
      UI.toolTip(false, translateLabel("widebodycivic_tt"))
    end
    if main_vehicle ~= 0 then
      ImGui.Separator()
      UI.coloredText(translateLabel("vc_main_veh"), 'green', 0.9, 20); ImGui.SameLine(); ImGui.Text(main_vehicle_name); ImGui
          .SameLine()
      if ImGui.Button(" " .. translateLabel("generic_delete") .. " ##mainVeh") then
        UI.widgetSound("Delete")
        script.run_in_fiber(function(delmv)
          if entities.take_control_of(main_vehicle, 300) then
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(main_vehicle, true, true)
            delmv:sleep(100)
            ENTITY.DELETE_ENTITY(main_vehicle)
          end
          if attached_vehicles[1] ~= nil then
            table.remove(attached_vehicles, 1)
          end
          if spawned_vehicles[1] ~= nil then
            for k, veh in ipairs(spawned_vehicles) do
              if ENTITY.DOES_ENTITY_EXIST(veh) then
                main_vehicle = veh
                main_vehicle_name = vehicles.get_vehicle_display_name(ENTITY.GET_ENTITY_MODEL(main_vehicle))
                table.remove(spawned_vehicles, k)
                table.remove(spawned_vehNames, k)
                table.remove(filteredVehNames, k)
              end
            end
          end
        end)
      end
    end
    if spawned_vehicles[1] ~= nil then
      ImGui.SeparatorText(translateLabel("vc_spawned_vehs"))
      ImGui.PushItemWidth(230)
      spawned_veh_index, _ = ImGui.Combo("##Spawned Vehicles", spawned_veh_index, filteredVehNames, #spawned_vehicles)
      ImGui.PopItemWidth()
      selectedVeh = spawned_vehicles[spawned_veh_index + 1]
      ImGui.SameLine()
      if ImGui.Button("   " .. translateLabel("generic_delete") .. "   ##spawnedVeh") then
        UI.widgetSound("Delete")
        script.run_in_fiber(function(del)
          if entities.take_control_of(selectedVeh, 300) then
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(selectedVeh, true, true)
            del:sleep(200)
            VEHICLE.DELETE_VEHICLE(selectedVeh)
            -- vehicle_creation = {}
            creation_name    = ""
            attached_vehicle = 0
            if spawned_veh_index ~= 0 then
              spawned_veh_index = 0
            end
            if attachment_index ~= 0 then
              attachment_index = 0
            end
          else
            gui.show_error("Samurais Scripts", translateLabel("generic_veh_delete_fail"))
          end
        end)
      end
      if ImGui.Button(translateLabel("vc_attach_btn") .. main_vehicle_name) then
        if selectedVeh ~= main_vehicle then
          script.run_in_fiber(function()
            if not ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(selectedVeh, main_vehicle) then
              UI.widgetSound("Select")
              ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedVeh, main_vehicle,
                ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), veh_attach_X, veh_attach_Y,
                veh_attach_Z, veh_attach_RX, veh_attach_RY, veh_attach_RZ, false, false, false,
                false,
                2, true, 1)
              attached_vehicles.entity                                                              = selectedVeh
              attached_vehicles.hash                                                                = ENTITY
                  .GET_ENTITY_MODEL(selectedVeh)
              attached_vehicles.name                                                                = vehicles
                  .get_vehicle_display_name(ENTITY.GET_ENTITY_MODEL(selectedVeh))
              attached_vehicles.posx                                                                = veh_attach_X
              attached_vehicles.posy                                                                = veh_attach_Y
              attached_vehicles.posz                                                                = veh_attach_Z
              attached_vehicles.rotx                                                                = veh_attach_RX
              attached_vehicles.roty                                                                = veh_attach_RY
              attached_vehicles.rotz                                                                = veh_attach_RZ
              attached_vehicles.tint                                                                = VEHICLE
                  .GET_VEHICLE_WINDOW_TINT(selectedVeh)
              attached_vehicles.color_1.r, attached_vehicles.color_1.g, attached_vehicles.color_1.b = VEHICLE
                  .GET_VEHICLE_CUSTOM_PRIMARY_COLOUR(selectedVeh, attached_vehicles.color_1.r,
                    attached_vehicles.color_1.g,
                    attached_vehicles.color_1.b)
              attached_vehicles.color_2.r, attached_vehicles.color_2.g, attached_vehicles.color_2.b = VEHICLE
                  .GET_VEHICLE_CUSTOM_SECONDARY_COLOUR(selectedVeh, attached_vehicles.color_2.r,
                    attached_vehicles.color_2.g,
                    attached_vehicles.color_2.b)
              appendVehicleMods(selectedVeh, attached_vehicles.mods)
              table.insert(veh_attachments, attached_vehicles)
              attached_vehicles = { entity = 0, hash = 0, mods = {}, color_1 = { r = 0, g = 0, b = 0 }, color_2 = { r = 0, g = 0, b = 0 }, tint = 0, posx = 0.0, posy = 0.0, posz = 0.0, rotx = 0.0, roty = 0.0, rotz = 0.0 }
            else
              UI.widgetSound("Error")
              gui.show_error("Samurais Scripts", translateLabel("vc_alrattached_err"))
            end
          end)
        else
          UI.widgetSound("Error")
          gui.show_error("Samurais Scripts", translateLabel("vc_selfattach_err"))
        end
      end
    end
    if veh_attachments[1] ~= nil then
      ImGui.Spacing(); ImGui.SeparatorText("Attached Vehicles")
      ImGui.PushItemWidth(230)
      showAttachedVehicles()
      ImGui.PopItemWidth()
      selected_attchmnt = veh_attachments[attachment_index + 1]
      ImGui.Text(translateLabel("generic_multiplier_label"))
      ImGui.PushItemWidth(271)
      veh_axisMult, _ = ImGui.InputInt("##AttachMultiplier", veh_axisMult, 1, 2)
      ImGui.PopItemWidth()
      ImGui.Spacing()
      ImGui.Text("X Axis :"); ImGui.SameLine(); ImGui.Dummy(25, 1); ImGui.SameLine(); ImGui.Text("Y Axis :"); ImGui
          .SameLine()
      ImGui.Dummy(25, 1); ImGui.SameLine(); ImGui.Text("Z Axis :")
      ImGui.ArrowButton("##Xleft", 0)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.posx = selected_attchmnt.posx + 0.001 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.SameLine()
      ImGui.ArrowButton("##XRight", 1)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.posx = selected_attchmnt.posx - 0.001 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.SameLine()
      ImGui.Dummy(5, 1); ImGui.SameLine()
      ImGui.ArrowButton("##Yleft", 0)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.posy = selected_attchmnt.posy + 0.001 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.SameLine()
      ImGui.ArrowButton("##YRight", 1)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.posy = selected_attchmnt.posy - 0.001 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.SameLine()
      ImGui.Dummy(5, 1); ImGui.SameLine()
      ImGui.ArrowButton("##zUp", 2)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.posz = selected_attchmnt.posz + 0.001 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.SameLine()
      ImGui.ArrowButton("##zDown", 3)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.posz = selected_attchmnt.posz - 0.001 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.Text("X Rotation :"); ImGui.SameLine(); ImGui.Text("Y Rotation :"); ImGui.SameLine(); ImGui.Text(
        "Z Rotation :")
      ImGui.ArrowButton("##rotXleft", 0)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.rotx = selected_attchmnt.rotx + 0.01 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.SameLine()
      ImGui.ArrowButton("##rotXright", 1)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.rotx = selected_attchmnt.rotx - 0.01 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.SameLine()
      ImGui.Dummy(5, 1); ImGui.SameLine()
      ImGui.ArrowButton("##rotYleft", 0)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.roty = selected_attchmnt.roty + 0.01 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.SameLine()
      ImGui.ArrowButton("##rotYright", 1)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.roty = selected_attchmnt.roty - 0.01 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.SameLine()
      ImGui.Dummy(5, 1); ImGui.SameLine()
      ImGui.ArrowButton("##rotZup", 2)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.rotz = selected_attchmnt.rotz + 0.01 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.SameLine()
      ImGui.ArrowButton("##rotZdown", 3)
      if ImGui.IsItemActive() then
        UI.widgetSound("Nav")
        selected_attchmnt.rotz = selected_attchmnt.rotz - 0.01 * veh_axisMult
        ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_attchmnt.entity, main_vehicle,
          ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(main_vehicle, "chassis_dummy"), selected_attchmnt.posx,
          selected_attchmnt.posy,
          selected_attchmnt.posz, selected_attchmnt.rotx, selected_attchmnt.roty, selected_attchmnt.rotz, false, false,
          false,
          false,
          2, true, 1)
      end
      ImGui.Spacing()
      if ImGui.Button("   " .. translateLabel("saveBtn") .. "   ##vehcreator1") then
        UI.widgetSound("Select2")
        ImGui.OpenPopup("Save Merged Vehicles")
      end
      ImGui.SetNextWindowPos(760, 400, ImGuiCond.Appearing)
      ImGui.SetNextWindowBgAlpha(0.81)
      if ImGui.BeginPopupModal("Save Merged Vehicles", ImGuiWindowFlags.AlwaysAutoResize | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.NoTitleBar) then
        creation_name, _ = ImGui.InputTextWithHint("##save_merge", translateLabel("vc_choose_name_hint"), creation_name,
          128)
        if ImGui.IsItemActive() then
          is_typing = true
        else
          is_typing = false
        end
        ImGui.Spacing()
        if not start_loading_anim then
          if ImGui.Button(translateLabel("saveBtn") .. "##vehcreator2") then
            script.run_in_fiber(function(save)
              if creation_name ~= "" then
                if saved_vehicles[1] ~= nil then
                  for _, v in pairs(saved_vehicles) do
                    if creation_name == v.name then
                      UI.widgetSound("Error")
                      gui.show_error("Samurai's Scripts", translateLabel("vc_same_name_err"))
                      return
                    end
                  end
                end
                UI.widgetSound("Select")
                vehicle_creation.name                                                              = creation_name
                vehicle_creation.main_veh                                                          = ENTITY
                    .GET_ENTITY_MODEL(main_vehicle)
                vehicle_creation.attachments                                                       = veh_attachments
                vehicle_creation.tint                                                              = VEHICLE
                    .GET_VEHICLE_WINDOW_TINT(main_vehicle)
                vehicle_creation.color_1.r, vehicle_creation.color_1.g, vehicle_creation.color_1.b = VEHICLE
                    .GET_VEHICLE_CUSTOM_PRIMARY_COLOUR(main_vehicle, vehicle_creation.color_1.r,
                      vehicle_creation.color_1.g,
                      vehicle_creation.color_1.b)
                vehicle_creation.color_2.r, vehicle_creation.color_2.g, vehicle_creation.color_2.b = VEHICLE
                    .GET_VEHICLE_CUSTOM_SECONDARY_COLOUR(main_vehicle, vehicle_creation.color_2.r,
                      vehicle_creation.color_2
                      .g, vehicle_creation.color_2.b)
                appendVehicleMods(main_vehicle, vehicle_creation.mods)
                start_loading_anim = true
                save:sleep(500)
                table.insert(saved_vehicles, vehicle_creation)
                lua_cfg.save("saved_vehicles", saved_vehicles)
                ENTITY.SET_ENTITY_AS_NO_LONGER_NEEDED(main_vehicle)
                for _, veh in ipairs(spawned_vehicles) do
                  ENTITY.SET_ENTITY_AS_NO_LONGER_NEEDED(veh)
                end
                gui.show_success("Samurais Scripts", translateLabel("vc_saved_msg"))
                resetOnSave()
                start_loading_anim = false
                ImGui.CloseCurrentPopup()
              else
                UI.widgetSound("Error")
                gui.show_warning("Samurais Scripts", translateLabel("vc_save_err"))
              end
            end)
          end
        else
          ImGui.BeginDisabled()
          ImGui.Button("  " .. loading_label .. "  ")
          ImGui.EndDisabled()
        end
        ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine()
        if ImGui.Button(translateLabel("generic_cancel_btn") .. "##vehcreator") then
          UI.widgetSound("Cancel")
          creation_name = ""
          ImGui.CloseCurrentPopup()
        end
        ImGui.End()
      end
    end
  elseif persist_switch == 1 then
    if saved_vehicles[1] ~= nil then
      ImGui.PushItemWidth(350)
      showSavedVehicles()
      ImGui.PopItemWidth()
      persist_info = filteredCreations[persist_index + 1]
      ImGui.Spacing()
      if ImGui.Button(translateLabel("vc_spawn_persist") .. "##vehcreator") then
        UI.widgetSound("Select")
        spawnPersistVeh(persist_info.main_veh, persist_info.mods, persist_info.color_1, persist_info.color_2,
          persist_info.tint, persist_info.attachments)
      end
      ImGui.SameLine(); ImGui.Dummy(5, 1); ImGui.SameLine()
      if UI.coloredButton(translateLabel("vc_delete_persist"), "#E40000", "#FF3F3F", "#FF8080", 0.87) then
        UI.widgetSound("Focus_In")
        ImGui.OpenPopup("Remove Persistent")
      end
      ImGui.SetNextWindowPos(760, 400, ImGuiCond.Appearing)
      ImGui.SetNextWindowSizeConstraints(200, 100, 400, 400)
      ImGui.SetNextWindowBgAlpha(0.7)
      if ImGui.BeginPopupModal("Remove Persistent", ImGuiWindowFlags.AlwaysAutoResize | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.NoTitleBar) then
        UI.coloredText(translateLabel("confirm_txt"), "yellow", 0.91, 35)
        ImGui.Dummy(1, 20)
        if ImGui.Button("   " .. translateLabel("yes") .. "   ##vehcreator") then
          for key, value in ipairs(saved_vehicles) do
            if persist_info == value then
              table.remove(saved_vehicles, key)
              lua_cfg.save("saved_vehicles", saved_vehicles)
            end
          end
          if saved_vehicles[1] == nil then
            persist_switch = 0
          end
          UI.widgetSound("Select")
          ImGui.CloseCurrentPopup()
          gui.show_success("Samurais Scripts", translateLabel("vc_delete_msg"))
        end
        ImGui.SameLine(); ImGui.Dummy(20, 1); ImGui.SameLine()
        if ImGui.Button("   " .. translateLabel("no") .. "   ##vehcreator") then
          UI.widgetSound("Cancel")
          ImGui.CloseCurrentPopup()
        end
        ImGui.End()
      end
    end
  end
end)


--[[
    *online*
]]
online_tab           = Samurais_scripts:add_tab("Online ")

business_tab         = online_tab:add_tab("Business Manager (YRV2)")
local wh1_loop       = false
local wh2_loop       = false
local wh3_loop       = false
local wh4_loop       = false
local wh5_loop       = false
local hangarLoop     = false
local hangarTotal    = 0
local fcashTotal     = 0
local cokeTotal      = 0
local methTotal      = 0
local weedTotal      = 0
local fdTotal        = 0
local bunkerTotal    = 0
local acidTotal      = 0
local wh1Supplies    = 0
local wh2Supplies    = 0
local wh3Supplies    = 0
local wh4Supplies    = 0
local wh5Supplies    = 0
local hangarSupplies = 0
local wh1Value       = 0
local wh2Value       = 0
local wh3Value       = 0
local wh4Value       = 0
local wh5Value       = 0
local ceo_moola      = 0
local yrv2_color     = { 0, 255, 255, 1 }
business_tab:add_imgui(function()
  local window_width = ImGui.GetWindowWidth()
  ImGui.Spacing(); ImGui.Dummy((window_width / 2) - 110, 1); ImGui.SameLine(); UI.coloredText("- YimResupplier V2 -",
    yrv2_color, 1, 60)
  if Game.isOnline() then
    local hangarOwned = stats.get_int(MPx .. "_PROP_HANGAR") ~= 0
    local fCashOwned  = stats.get_int(MPx .. "_PROP_FAC_SLOT0") ~= 0
    local cokeOwned   = stats.get_int(MPx .. "_PROP_FAC_SLOT1") ~= 0
    local methOwned   = stats.get_int(MPx .. "_PROP_FAC_SLOT2") ~= 0
    local weedOwned   = stats.get_int(MPx .. "_PROP_FAC_SLOT3") ~= 0
    local fdOwned     = stats.get_int(MPx .. "_PROP_FAC_SLOT4") ~= 0
    local bunkerOwned = stats.get_int(MPx .. "_PROP_FAC_SLOT5") ~= 0
    local acidOwned   = stats.get_int(MPx .. "_PROP_FAC_SLOT6") ~= 0
    if CURRENT_BUILD == TARGET_BUILD then
      ImGui.Spacing(); ImGui.BeginTabBar("CEO Warehouses", ImGuiTabBarFlags.None)
      if ImGui.BeginTabItem(translateLabel("ceo_whouses_title")) then
        ImGui.Spacing(); ImGui.Text(translateLabel("ceo_whouses_txt")); ImGui.Spacing()

        whouse_1_owned, wh1Used = ImGui.Checkbox("1", whouse_1_owned); ImGui.SameLine(); ImGui.Dummy(80, 1); ImGui
            .SameLine()
        if wh1Used then
          UI.widgetSound("Nav2")
          lua_cfg.save("whouse_1_owned", whouse_1_owned)
        end

        ImGui.BeginDisabled(not whouse_1_owned)
        whouse_2_owned, wh2Used = ImGui.Checkbox("2", whouse_2_owned); ImGui.SameLine(); ImGui.Dummy(80, 1); ImGui
            .SameLine()
        if wh2Used then
          UI.widgetSound("Nav2")
          lua_cfg.save("whouse_2_owned", whouse_2_owned)
        end
        ImGui.EndDisabled()

        ImGui.BeginDisabled(not whouse_2_owned)
        whouse_3_owned, wh3Used = ImGui.Checkbox("3", whouse_3_owned); ImGui.SameLine(); ImGui.Dummy(80, 1); ImGui
            .SameLine()
        if wh3Used then
          UI.widgetSound("Nav2")
          lua_cfg.save("whouse_3_owned", whouse_3_owned)
        end
        ImGui.EndDisabled()

        ImGui.BeginDisabled(not whouse_3_owned)
        whouse_4_owned, wh4Used = ImGui.Checkbox("4", whouse_4_owned); ImGui.SameLine(); ImGui.Dummy(80, 1); ImGui
            .SameLine()
        if wh4Used then
          UI.widgetSound("Nav2")
          lua_cfg.save("whouse_4_owned", whouse_4_owned)
        end
        ImGui.EndDisabled()

        ImGui.BeginDisabled(not whouse_4_owned)
        whouse_5_owned, wh5Used = ImGui.Checkbox("5", whouse_5_owned)
        if wh5Used then
          UI.widgetSound("Nav2")
          lua_cfg.save("whouse_5_owned", whouse_5_owned)
        end
        ImGui.EndDisabled()

        if whouse_1_owned then
          wh1Supplies = stats.get_int(MPx .. "_CONTOTALFORWHOUSE0")
          if wh1Supplies ~= nil and wh1Supplies > 0 then
            wh1Value = globals.get_int(262145 + (SS.get_ceo_global_offset(wh1Supplies)))
          else
            wh1Value = 0
          end
          wh1Total  = wh1Value * wh1Supplies
          ceo_moola = wh1Total
          ImGui.SeparatorText(translateLabel("Warehouse") .. " 1")
          whouse_1_size.small, wh1sUsed = ImGui.Checkbox("Small", whouse_1_size.small); ImGui.SameLine()
          if wh1sUsed then
            UI.widgetSound("Nav2")
            whouse_1_size.medium = false
            whouse_1_size.large  = false
            lua_cfg.save("whouse_1_size", whouse_1_size)
          end
          whouse_1_size.medium, wh1mUsed = ImGui.Checkbox("Medium", whouse_1_size.medium); ImGui.SameLine()
          if wh1mUsed then
            UI.widgetSound("Nav2")
            whouse_1_size.small = false
            whouse_1_size.large = false
            lua_cfg.save("whouse_1_size", whouse_1_size)
          end
          whouse_1_size.large, wh1lUsed = ImGui.Checkbox("Large", whouse_1_size.large)
          if wh1lUsed then
            UI.widgetSound("Nav2")
            whouse_1_size.small = false
            whouse_1_size.medium = false
            lua_cfg.save("whouse_1_size", whouse_1_size)
          end
          if whouse_1_size.small then
            whouse1_max = 16
          elseif whouse_1_size.medium then
            whouse1_max = 42
          elseif whouse_1_size.large then
            whouse1_max = 111
          end
          if whouse_1_size.small or whouse_1_size.medium or whouse_1_size.large then
            ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine(); ImGui.ProgressBar(
              (wh1Supplies / whouse1_max), 240, 30)
            if wh1Supplies < whouse1_max then
              ImGui.SameLine()
              ImGui.BeginDisabled(wh1_loop or wh2_loop or wh3_loop or wh4_loop or wh5_loop)
              if ImGui.Button(translateLabel("random_crates") .. "##wh1") then
                stats.set_bool_masked(MPx .. "_FIXERPSTAT_BOOL1", true, 12)
              end
              ImGui.EndDisabled()
              -- ImGui.BeginDisabled(wh2_loop or wh3_loop or wh4_loop or wh5_loop)
              ImGui.SameLine(); wh1_loop, wh1lUsed = ImGui.Checkbox("Auto##wh1", wh1_loop)
              -- ImGui.EndDisabled()
              if wh1lUsed then
                UI.widgetSound("Nav2")
                if wh1_loop then
                  -- wh2_loop, wh3_loop, wh4_loop, wh5_loop = false, false, false, false
                  script.run_in_fiber(function(wh1l)
                    repeat
                      stats.set_bool_masked(MPx .. "_FIXERPSTAT_BOOL1", true, 12)
                      wh1l:sleep(supply_autofill_delay)
                    until
                      wh1Supplies == whouse1_max or wh1_loop == false
                  end)
                end
              end
            else
              if wh1_loop then
                wh1_loop = false
              end
            end
            ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
            ImGui.ProgressBar((wh1Supplies / whouse1_max), 240, 30,
              tostring(wh1Supplies) .. " Crates (" .. tostring(math.floor((wh1Supplies / whouse1_max) * 100)) .. "%)")
            ImGui.SameLine(); ImGui.Text("Value: " .. lua_Fn.formatMoney(wh1Total))
          else
            ImGui.Text("Please select your warehouse size.")
          end
        else
          whouse_2_owned, whouse_3_owned, whouse_4_owned, whouse_5_owned = false, false, false, false
        end
        if whouse_2_owned then
          wh2Supplies = stats.get_int(MPx .. "_CONTOTALFORWHOUSE1")
          if wh2Supplies ~= nil and wh2Supplies > 0 then
            wh2Value = globals.get_int(262145 + (SS.get_ceo_global_offset(wh2Supplies)))
          else
            wh2Value = 0
          end
          wh2Total  = wh2Value * wh2Supplies
          ceo_moola = wh1Total + wh2Total
          ImGui.SeparatorText(translateLabel("Warehouse") .. " 2")
          whouse_2_size.small, wh2sUsed = ImGui.Checkbox("Small##wh2", whouse_2_size.small); ImGui.SameLine()
          if wh2sUsed then
            UI.widgetSound("Nav2")
            whouse_2_size.medium = false
            whouse_2_size.large  = false
            lua_cfg.save("whouse_2_size", whouse_2_size)
          end
          whouse_2_size.medium, wh2mUsed = ImGui.Checkbox("Medium##wh2", whouse_2_size.medium); ImGui.SameLine()
          if wh2mUsed then
            UI.widgetSound("Nav2")
            whouse_2_size.small = false
            whouse_2_size.large = false
            lua_cfg.save("whouse_2_size", whouse_2_size)
          end
          whouse_2_size.large, wh2lUsed = ImGui.Checkbox("Large##wh2", whouse_2_size.large)
          if wh2lUsed then
            UI.widgetSound("Nav2")
            whouse_2_size.small = false
            whouse_2_size.medium = false
            lua_cfg.save("whouse_2_size", whouse_2_size)
          end
          if whouse_2_size.small then
            whouse2_max = 16
          elseif whouse_2_size.medium then
            whouse2_max = 42
          elseif whouse_2_size.large then
            whouse2_max = 111
          end
          if whouse_2_size.small or whouse_2_size.medium or whouse_2_size.large then
            ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine(); ImGui.ProgressBar(
              (wh2Supplies / whouse2_max), 240, 30)
            if wh2Supplies < whouse2_max then
              ImGui.SameLine()
              ImGui.BeginDisabled(wh1_loop or wh2_loop or wh3_loop or wh4_loop or wh5_loop)
              if ImGui.Button(translateLabel("random_crates") .. "##wh2") then
                stats.set_bool_masked(MPx .. "_FIXERPSTAT_BOOL1", true, 13)
              end
              ImGui.EndDisabled()
              -- ImGui.BeginDisabled(wh1_loop or wh3_loop or wh4_loop or wh5_loop)
              ImGui.SameLine(); wh2_loop, wh2lUsed = ImGui.Checkbox("Auto##wh2", wh2_loop)
              -- ImGui.EndDisabled()
              if wh2lUsed then
                UI.widgetSound("Nav2")
                if wh2_loop then
                  -- wh1_loop, wh3_loop, wh4_loop, wh5_loop = false, false, false, false
                  script.run_in_fiber(function(wh2l)
                    repeat
                      stats.set_bool_masked(MPx .. "_FIXERPSTAT_BOOL1", true, 13)
                      wh2l:sleep(supply_autofill_delay)
                    until
                      wh2Supplies == whouse2_max or wh2_loop == false
                  end)
                end
              end
            else
              if wh2_loop then
                wh2_loop = false
              end
            end
            ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
            ImGui.ProgressBar((wh2Supplies / whouse2_max), 240, 30,
              tostring(wh2Supplies) .. " Crates (" .. tostring(math.floor((wh2Supplies / whouse2_max) * 100)) .. "%)")
            ImGui.SameLine(); ImGui.Text("Value: " .. lua_Fn.formatMoney(wh2Total))
          else
            ImGui.Text("Please select your warehouse size.")
          end
        else
          whouse_3_owned, whouse_4_owned, whouse_5_owned = false, false, false
        end
        if whouse_3_owned then
          wh3Supplies = stats.get_int(MPx .. "_CONTOTALFORWHOUSE2")
          if wh3Supplies ~= nil and wh3Supplies > 0 then
            wh3Value = globals.get_int(262145 + (SS.get_ceo_global_offset(wh3Supplies)))
          else
            wh3Value = 0
          end
          wh3Total  = wh3Value * wh3Supplies
          ceo_moola = wh1Total + wh2Total + wh3Total
          ImGui.SeparatorText(translateLabel("Warehouse") .. " 3")
          whouse_3_size.small, wh3sUsed = ImGui.Checkbox("Small##wh3", whouse_3_size.small); ImGui.SameLine()
          if wh3sUsed then
            UI.widgetSound("Nav2")
            whouse_3_size.medium = false
            whouse_3_size.large  = false
            lua_cfg.save("whouse_3_size", whouse_3_size)
          end
          whouse_3_size.medium, wh3mUsed = ImGui.Checkbox("Medium##wh3", whouse_3_size.medium); ImGui.SameLine()
          if wh3mUsed then
            UI.widgetSound("Nav2")
            whouse_3_size.small = false
            whouse_3_size.large = false
            lua_cfg.save("whouse_3_size", whouse_3_size)
          end
          whouse_3_size.large, wh3lUsed = ImGui.Checkbox("Large##wh3", whouse_3_size.large)
          if wh3lUsed then
            UI.widgetSound("Nav2")
            whouse_3_size.small  = false
            whouse_3_size.medium = false
            lua_cfg.save("whouse_3_size", whouse_3_size)
          end
          if whouse_3_size.small then
            whouse3_max = 16
          elseif whouse_3_size.medium then
            whouse3_max = 42
          elseif whouse_3_size.large then
            whouse3_max = 111
          end
          if whouse_3_size.small or whouse_3_size.medium or whouse_3_size.large then
            ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine(); ImGui.ProgressBar(
              (wh3Supplies / whouse3_max), 240, 30)
            if wh3Supplies < whouse3_max then
              ImGui.SameLine()
              ImGui.BeginDisabled(wh1_loop or wh2_loop or wh3_loop or wh4_loop or wh5_loop)
              if ImGui.Button(translateLabel("random_crates") .. "##wh3") then
                stats.set_bool_masked(MPx .. "_FIXERPSTAT_BOOL1", true, 14)
              end
              ImGui.EndDisabled()
              -- ImGui.BeginDisabled(wh1_loop or wh2_loop or wh4_loop or wh5_loop)
              ImGui.SameLine(); wh3_loop, wh3lUsed = ImGui.Checkbox("Auto##wh3", wh3_loop)
              -- ImGui.EndDisabled()
              if wh3lUsed then
                UI.widgetSound("Nav2")
                if wh3_loop then
                  -- wh1_loop, wh2_loop, wh4_loop, wh5_loop = false, false, false, false
                  script.run_in_fiber(function(wh3l)
                    repeat
                      stats.set_bool_masked(MPx .. "_FIXERPSTAT_BOOL1", true, 14)
                      wh3l:sleep(supply_autofill_delay)
                    until
                      wh3Supplies == whouse3_max or wh3_loop == false
                  end)
                end
              end
            else
              if wh3_loop then
                wh3_loop = false
              end
            end
            ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
            ImGui.ProgressBar((wh3Supplies / whouse3_max), 240, 30,
              tostring(wh3Supplies) .. " Crates (" .. tostring(math.floor((wh3Supplies / whouse3_max) * 100)) .. "%)")
            ImGui.SameLine(); ImGui.Text("Value: " .. lua_Fn.formatMoney(wh3Total))
          else
            ImGui.Text("Please select your warehouse size.")
          end
        else
          whouse_4_owned, whouse_5_owned = false, false
        end
        if whouse_4_owned then
          wh4Supplies = stats.get_int(MPx .. "_CONTOTALFORWHOUSE3")
          if wh4Supplies ~= nil and wh4Supplies > 0 then
            wh4Value = globals.get_int(262145 + (SS.get_ceo_global_offset(wh4Supplies)))
          else
            wh4Value = 0
          end
          wh4Total  = wh4Value * wh4Supplies
          ceo_moola = wh1Total + wh2Total + wh3Total + wh4Total
          ImGui.SeparatorText(translateLabel("Warehouse") .. " 4")
          whouse_4_size.small, wh4sUsed = ImGui.Checkbox("Small##wh4", whouse_4_size.small); ImGui.SameLine()
          if wh4sUsed then
            UI.widgetSound("Nav2")
            whouse_4_size.medium = false
            whouse_4_size.large  = false
            lua_cfg.save("whouse_4_size", whouse_4_size)
          end
          whouse_4_size.medium, wh4mUsed = ImGui.Checkbox("Medium##wh4", whouse_4_size.medium); ImGui.SameLine()
          if wh4mUsed then
            UI.widgetSound("Nav2")
            whouse_4_size.small = false
            whouse_4_size.large = false
            lua_cfg.save("whouse_4_size", whouse_4_size)
          end
          whouse_4_size.large, wh4lUsed = ImGui.Checkbox("Large##wh4", whouse_4_size.large)
          if wh4lUsed then
            UI.widgetSound("Nav2")
            whouse_4_size.small  = false
            whouse_4_size.medium = false
            lua_cfg.save("whouse_4_size", whouse_4_size)
          end
          if whouse_4_size.small then
            whouse4_max = 16
          elseif whouse_4_size.medium then
            whouse4_max = 42
          elseif whouse_4_size.large then
            whouse4_max = 111
          end
          if whouse_4_size.small or whouse_4_size.medium or whouse_4_size.large then
            ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine(); ImGui.ProgressBar(
              (wh4Supplies / whouse4_max), 240, 30)
            if wh4Supplies < whouse4_max then
              ImGui.SameLine()
              ImGui.BeginDisabled(wh1_loop or wh2_loop or wh3_loop or wh4_loop or wh5_loop)
              if ImGui.Button(translateLabel("random_crates") .. "##wh4") then
                stats.set_bool_masked(MPx .. "_FIXERPSTAT_BOOL1", true, 15)
              end
              ImGui.EndDisabled()
              -- ImGui.BeginDisabled(wh1_loop or wh2_loop or wh3_loop or wh5_loop)
              ImGui.SameLine(); wh4_loop, wh4lUsed = ImGui.Checkbox("Auto##wh4", wh4_loop)
              -- ImGui.EndDisabled()
              if wh4lUsed then
                UI.widgetSound("Nav2")
                if wh4_loop then
                  -- wh1_loop, wh2_loop, wh3_loop, wh5_loop = false, false, false, false
                  script.run_in_fiber(function(wh4l)
                    repeat
                      stats.set_bool_masked(MPx .. "_FIXERPSTAT_BOOL1", true, 15)
                      wh4l:sleep(supply_autofill_delay)
                    until
                      wh4Supplies == whouse4_max or wh4_loop == false
                  end)
                end
              end
            else
              if wh4_loop then
                wh4_loop = false
              end
            end
            ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
            ImGui.ProgressBar((wh4Supplies / whouse4_max), 240, 30,
              tostring(wh4Supplies) .. " Crates (" .. tostring(math.floor((wh4Supplies / whouse4_max) * 100)) .. "%)")
            ImGui.SameLine(); ImGui.Text("Value: " .. lua_Fn.formatMoney(wh4Total))
          else
            ImGui.Text("Please select your warehouse size.")
          end
        else
          whouse_5_owned = false
        end
        if whouse_5_owned then
          wh5Supplies = stats.get_int(MPx .. "_CONTOTALFORWHOUSE4")
          if wh5Supplies ~= nil and wh5Supplies > 0 then
            wh5Value = globals.get_int(262145 + (SS.get_ceo_global_offset(wh5Supplies)))
          else
            wh5Value = 0
          end
          wh5Total  = wh5Value * wh5Supplies
          ceo_moola = wh1Total + wh2Total + wh3Total + wh4Total + wh5Total
          ImGui.SeparatorText(translateLabel("Warehouse") .. " 5")
          whouse_5_size.small, wh5sUsed = ImGui.Checkbox("Small##wh5", whouse_5_size.small); ImGui.SameLine()
          if wh5sUsed then
            UI.widgetSound("Nav2")
            whouse_5_size.medium = false
            whouse_5_size.large  = false
            lua_cfg.save("whouse_5_size", whouse_5_size)
          end
          whouse_5_size.medium, wh5mUsed = ImGui.Checkbox("Medium##wh5", whouse_5_size.medium); ImGui.SameLine()
          if wh5mUsed then
            UI.widgetSound("Nav2")
            whouse_5_size.small = false
            whouse_5_size.large = false
            lua_cfg.save("whouse_5_size", whouse_5_size)
          end
          whouse_5_size.large, wh5lUsed = ImGui.Checkbox("Large##wh5", whouse_5_size.large)
          if wh5lUsed then
            UI.widgetSound("Nav2")
            whouse_5_size.small  = false
            whouse_5_size.medium = false
            lua_cfg.save("whouse_5_size", whouse_5_size)
          end
          if whouse_5_size.small then
            whouse5_max = 16
          elseif whouse_5_size.medium then
            whouse5_max = 42
          elseif whouse_5_size.large then
            whouse5_max = 111
          end
          if whouse_5_size.small or whouse_5_size.medium or whouse_5_size.large then
            ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine(); ImGui.ProgressBar(
              (wh5Supplies / whouse5_max), 240, 30)
            if wh5Supplies < whouse5_max then
              ImGui.SameLine()
              ImGui.BeginDisabled(wh1_loop or wh2_loop or wh3_loop or wh4_loop or wh5_loop)
              if ImGui.Button(translateLabel("random_crates") .. "##wh5") then
                stats.set_bool_masked(MPx .. "_FIXERPSTAT_BOOL1", true, 16)
              end
              ImGui.EndDisabled()
              -- ImGui.BeginDisabled(wh1_loop or wh2_loop or wh3_loop or wh4_loop)
              ImGui.SameLine(); wh5_loop, wh5lUsed = ImGui.Checkbox("Auto##wh5", wh5_loop)
              -- ImGui.EndDisabled()
              if wh5lUsed then
                UI.widgetSound("Nav2")
                if wh5_loop then
                  -- wh1_loop, wh2_loop, wh3_loop, wh4_loop = false, false, false, false
                  script.run_in_fiber(function(wh5l)
                    repeat
                      stats.set_bool_masked(MPx .. "_FIXERPSTAT_BOOL1", true, 16)
                      wh5l:sleep(supply_autofill_delay)
                    until
                      wh5Supplies == whouse5_max or wh5_loop == false
                  end)
                end
              end
            else
              if wh5_loop then
                wh5_loop = false
              end
            end
            ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
            ImGui.ProgressBar((wh5Supplies / whouse5_max), 240, 30,
              tostring(wh5Supplies) .. " Crates (" .. tostring(math.floor((wh5Supplies / whouse5_max) * 100)) .. "%)")
            ImGui.SameLine(); ImGui.Text("Value: " .. lua_Fn.formatMoney(wh5Total))
          else
            ImGui.Text("Please select your warehouse size.")
          end
        end
        ImGui.Separator(); ImGui.Spacing(); ImGui.Text("Total Value: " .. lua_Fn.formatMoney(ceo_moola))
        ImGui.EndTabItem()
      end

      if ImGui.BeginTabItem(translateLabel("hangar_title")) then
        ImGui.Dummy(1, 5)
        if hangarOwned then
          hangarSupplies = stats.get_int(MPx .. "_HANGAR_CONTRABAND_TOTAL")
          hangarTotal    = hangarSupplies * 30000
          ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine(); ImGui.ProgressBar(
            (hangarSupplies / 50), 240, 30)
          if hangarSupplies < 50 then
            ImGui.SameLine()
            ImGui.BeginDisabled(hangarLoop)
            if ImGui.Button(translateLabel("random_crates") .. "##hangar") then
              script.run_in_fiber(function()
                stats.set_bool_masked(MPx .. "_DLC22022PSTAT_BOOL3", true, 9)
              end)
            end
            ImGui.EndDisabled()
            ImGui.SameLine(); hangarLoop, hlUsed = ImGui.Checkbox("Auto##hangar", hangarLoop)
            if hlUsed then
              UI.widgetSound("Nav2")
              if hangarLoop then
                script.run_in_fiber(function(hgl)
                  repeat
                    stats.set_bool_masked(MPx .. "_DLC22022PSTAT_BOOL3", true, 9)
                    hgl:sleep(supply_autofill_delay)
                  until
                    hangarSupplies == 50 or hangarLoop == false
                end)
              end
            end
          else
            if hangarLoop then
              hangarLoop = false
            end
          end
          ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
          ImGui.ProgressBar((hangarSupplies / 50), 240, 30,
            tostring(hangarSupplies) .. " Crates (" .. tostring(math.floor(hangarSupplies / 0.5)) .. "%)")
          ImGui.SameLine(); ImGui.Text("Value: " .. lua_Fn.formatMoney(hangarTotal))
          if Game.Self.isOutside() then
            ImGui.Spacing(); ImGui.SeparatorText(translateLabel("quick_tp"))
            if ImGui.Button("Teleport To Hangar") then
              UI.widgetSound("Select")
              script.run_in_fiber(function()
                local h_blip = HUD.GET_FIRST_BLIP_INFO_ID(569)
                local h_coords
                if HUD.DOES_BLIP_EXIST(h_blip) then
                  h_coords = HUD.GET_BLIP_COORDS(h_blip)
                  Game.Self.teleport(true, h_coords)
                end
              end)
            end
            UI.helpMarker(true, translateLabel("tp_warn"), "#FFA134", 1)
          end
        else
          ImGui.Text("You don't own a hangar.")
        end
        ImGui.EndTabItem()
      end

      if ImGui.BeginTabItem("Bunker") then
        ImGui.Dummy(1, 5)
        if bunkerOwned then
          bunkerUpdgrade1, bu1Used = ImGui.Checkbox("Equipment Upgrade##bunker", bunkerUpdgrade1); ImGui.SameLine()
          if bu1Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("bunkerUpdgrade1", bunkerUpdgrade1)
          end
          bunkerUpdgrade2, bu2Used = ImGui.Checkbox("Staff Upgrade##bunker", bunkerUpdgrade2)
          if bu2Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("bunkerUpdgrade2", bunkerUpdgrade2)
          end
          if bunkerUpdgrade1 then
            bunkerOffset1 = globals.get_int(Global_262145.f_21256)
          else
            bunkerOffset1 = 0
          end
          if bunkerUpdgrade2 then
            bunkerOffset2 = globals.get_int(Global_262145.f_21255)
          else
            bunkerOffset2 = 0
          end
          local bunkerSupplies = stats.get_int(MPx .. "_MATTOTALFORFACTORY5")
          local bunkerStock    = stats.get_int(MPx .. "_PRODTOTALFORFACTORY5")
          bunkerTotal          = ((globals.get_int(Global_262145.f_21254) + bunkerOffset1 + bunkerOffset2) * bunkerStock)
          ImGui.Spacing()
          ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine(); ImGui.ProgressBar(
            (bunkerSupplies / 100), 240, 30)
          if bunkerSupplies < 100 then
            ImGui.SameLine()
            if ImGui.Button(" Fill Supplies ##Bunker") then
              globals.set_int(Global_1663174.f_5.f_1, 1)
            end
          end
          ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
          ImGui.ProgressBar((bunkerStock / 100), 240, 30, tostring(bunkerStock) ..
            " Crates (" .. tostring(bunkerStock) .. "%)")
          ImGui.SameLine(); ImGui.Text("Value:"); ImGui.SameLine();
          ImGui.Text("¤ Blaine County:  " ..
            lua_Fn.formatMoney(bunkerTotal) ..
            "\n¤ Los Santos:      " .. lua_Fn.formatMoney(math.floor(bunkerTotal * 1.5)))
          if Game.Self.isOutside() then
            ImGui.Spacing(); ImGui.SeparatorText("Quick Teleport")
            if ImGui.Button("Teleport To Bunker") then
              UI.widgetSound("Select")
              script.run_in_fiber(function()
                local b_blip = HUD.GET_FIRST_BLIP_INFO_ID(557)
                local b_coords
                if HUD.DOES_BLIP_EXIST(b_blip) then
                  b_coords = HUD.GET_BLIP_COORDS(b_blip)
                  Game.Self.teleport(true, b_coords)
                end
              end)
            end
            UI.helpMarker(true, translateLabel("tp_warn"), "#FFA134", 1)
          end
        else
          ImGui.Text("You don't own a bunker.")
        end
        ImGui.EndTabItem()
      end

      if ImGui.BeginTabItem("MC Businesses") then
        ImGui.Dummy(1, 5)
        ImGui.SeparatorText("Fake Cash")
        if fCashOwned then
          cashUpdgrade1, cu1Used = ImGui.Checkbox("Equipment Upgrade##fcash", cashUpdgrade1); ImGui.SameLine()
          if cu1Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("cashUpdgrade1", cashUpdgrade1)
          end
          cashUpdgrade2, cu2Used = ImGui.Checkbox("Staff Upgrade##fcash", cashUpdgrade2)
          if cu2Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("cashUpdgrade2", cashUpdgrade2)
          end
          if cashUpdgrade1 then
            cashOffset1 = globals.get_int(Global_262145.f_17326)
          else
            cashOffset1 = 0
          end
          if cashUpdgrade2 then
            cashOffset2 = globals.get_int(Global_262145.f_17332)
          else
            cashOffset2 = 0
          end
          local cashSupplies = stats.get_int(MPx .. "_MATTOTALFORFACTORY0")
          local fcashStock   = stats.get_int(MPx .. "_PRODTOTALFORFACTORY0")
          fcashTotal         = ((globals.get_int(Global_262145.f_17320) + cashOffset1 + cashOffset2) * fcashStock)
          ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine();
          ImGui.ProgressBar((cashSupplies / 100), 240, 30)
          if cashSupplies < 100 then
            ImGui.SameLine()
            if ImGui.Button(" Fill Supplies ##FakeCash") then
              globals.set_int(Global_1663174.f_0.f_1, 1)
            end
          end
          ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
          ImGui.ProgressBar((fcashStock / 40), 240, 30,
            tostring(fcashStock) .. " Boxes (" .. tostring(math.floor(fcashStock * 2.5)) .. "%)")
          ImGui.SameLine(); ImGui.Text("Value:"); ImGui.SameLine();
          ImGui.Text("¤ Blaine County:  " ..
            lua_Fn.formatMoney(fcashTotal) .. "\n¤ Los Santos:      " .. lua_Fn.formatMoney(math.floor(fcashTotal * 1.5)))
        else
          ImGui.Text("You don't own a Fake Cash business.")
        end

        ImGui.SeparatorText("Cocaine")
        if cokeOwned then
          cokeUpdgrade1, co1Used = ImGui.Checkbox("Equipment Upgrade##coke", cokeUpdgrade1); ImGui.SameLine()
          if co1Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("cokeUpdgrade1", cokeUpdgrade1)
          end
          cokeUpdgrade2, co2Used = ImGui.Checkbox("Staff Upgrade##coke", cokeUpdgrade2)
          if co2Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("cokeUpdgrade2", cokeUpdgrade2)
          end
          if cokeUpdgrade1 then
            cokeOffset1 = globals.get_int(Global_262145.f_17327)
          else
            cokeOffset1 = 0
          end
          if cokeUpdgrade2 then
            cokeOffset2 = globals.get_int(Global_262145.f_17333)
          else
            cokeOffset2 = 0
          end
          local cokeSupplies = stats.get_int(MPx .. "_MATTOTALFORFACTORY1")
          local cokeStock    = stats.get_int(MPx .. "_PRODTOTALFORFACTORY1")
          cokeTotal          = ((globals.get_int(Global_262145.f_17321) + cokeOffset1 + cokeOffset2) * cokeStock)
          ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine();
          ImGui.ProgressBar((cokeSupplies / 100), 240, 30)
          if cokeSupplies < 100 then
            ImGui.SameLine()
            if ImGui.Button(" Fill Supplies ##blow") then
              globals.set_int(Global_1663174.f_1.f_1, 1)
            end
          end
          ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
          ImGui.ProgressBar((cokeStock / 10), 240, 30,
            tostring(cokeStock) .. " Kilos (" .. tostring(cokeStock * 10) .. "%)")
          ImGui.SameLine(); ImGui.Text("Value:"); ImGui.SameLine();
          ImGui.Text("¤ Blaine County:  " ..
            lua_Fn.formatMoney(cokeTotal) .. "\n¤ Los Santos:      " .. lua_Fn.formatMoney(math.floor(cokeTotal * 1.5)))
        else
          ImGui.Text("You don't own a Cocaine business.")
        end

        ImGui.SeparatorText("Methamphetamine")
        if methOwned then
          methUpdgrade1, mu1Used = ImGui.Checkbox("Equipment Upgrade##meth", methUpdgrade1); ImGui.SameLine()
          if mu1Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("methUpdgrade1", methUpdgrade1)
          end
          methUpdgrade2, mu2Used = ImGui.Checkbox("Staff Upgrade##meth", methUpdgrade2)
          if mu2Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("methUpdgrade2", methUpdgrade2)
          end
          if methUpdgrade1 then
            methOffset1 = globals.get_int(Global_262145.f_17328)
          else
            methOffset1 = 0
          end
          if methUpdgrade2 then
            methOffset2 = globals.get_int(Global_262145.f_17334)
          else
            methOffset2 = 0
          end
          local methSupplies = stats.get_int(MPx .. "_MATTOTALFORFACTORY2")
          local methStock    = stats.get_int(MPx .. "_PRODTOTALFORFACTORY2")
          methTotal          = ((globals.get_int(Global_262145.f_17322) + methOffset1 + methOffset2) * methStock)
          ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine();
          ImGui.ProgressBar((methSupplies / 100), 240, 30)
          if methSupplies < 100 then
            ImGui.SameLine()
            if ImGui.Button(" Fill Supplies ##meth") then
              globals.set_int(Global_1663174.f_2.f_1, 1)
            end
          end
          ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
          ImGui.ProgressBar((methStock / 20), 240, 30,
            tostring(methStock) .. " Pounds (" .. tostring(methStock * 5) .. "%)")
          ImGui.SameLine(); ImGui.Text("Value:"); ImGui.SameLine();
          ImGui.Text("¤ Blaine County:  " ..
            lua_Fn.formatMoney(methTotal) .. "\n¤ Los Santos:      " .. lua_Fn.formatMoney(math.floor(methTotal * 1.5)))
        else
          ImGui.Text("You don't own a Meth business.")
        end

        ImGui.SeparatorText("Weed")
        if weedOwned then
          weedUpdgrade1, wu1Used = ImGui.Checkbox("Equipment Upgrade##weed", weedUpdgrade1); ImGui.SameLine()
          if wu1Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("weedUpdgrade1", weedUpdgrade1)
          end
          weedUpdgrade2, wu2Used = ImGui.Checkbox("Staff Upgrade##weed", weedUpdgrade2)
          if wu2Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("weedUpdgrade2", weedUpdgrade2)
          end
          if weedUpdgrade1 then
            weedOffset1 = globals.get_int(Global_262145.f_17329)
          else
            weedOffset1 = 0
          end
          if weedUpdgrade2 then
            weedOffset2 = globals.get_int(Global_262145.f_17335)
          else
            weedOffset2 = 0
          end
          local weedSupplies = stats.get_int(MPx .. "_MATTOTALFORFACTORY3")
          local weedStock    = stats.get_int(MPx .. "_PRODTOTALFORFACTORY3")
          weedTotal          = ((globals.get_int(Global_262145.f_17323) + weedOffset1 + weedOffset2) * weedStock)
          ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine();
          ImGui.ProgressBar((weedSupplies / 100), 240, 30)
          if weedSupplies < 100 then
            ImGui.SameLine()
            if ImGui.Button(" Fill Supplies ##weed") then
              globals.set_int(Global_1663174.f_3.f_1, 1)
            end
          end
          ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
          ImGui.ProgressBar((weedStock / 80), 240, 30,
            tostring(weedStock) .. " Pounds (" .. tostring(math.floor(weedStock / 8 * 10)) .. "%)")
          ImGui.SameLine(); ImGui.Text("Value:"); ImGui.SameLine();
          ImGui.Text("¤ Blaine County:  " ..
            lua_Fn.formatMoney(weedTotal) .. "\n¤ Los Santos:      " .. lua_Fn.formatMoney(math.floor(weedTotal * 1.5)))
        else
          ImGui.Text("You don't own a Weed business.")
        end

        ImGui.SeparatorText("Fake Documents")
        if fdOwned then
          fdUpdgrade1, fd1Used = ImGui.Checkbox("Equipment Upgrade##fd", fdUpdgrade1); ImGui.SameLine()
          if fd1Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("fdUpdgrade1", fdUpdgrade1)
          end
          fdUpdgrade2, fd2Used = ImGui.Checkbox("Staff Upgrade##fd", fdUpdgrade2)
          if fd2Used then
            UI.widgetSound("Nav2")
            lua_cfg.save("fdUpdgrade2", fdUpdgrade2)
          end
          if fdUpdgrade1 then
            fdOffset1 = globals.get_int(Global_262145.f_17325)
          else
            fdOffset1 = 0
          end
          if fdUpdgrade2 then
            fdOffset2 = globals.get_int(Global_262145.f_17331)
          else
            fdOffset2 = 0
          end
          local fdSupplies = stats.get_int(MPx .. "_MATTOTALFORFACTORY4")
          local fdStock    = stats.get_int(MPx .. "_PRODTOTALFORFACTORY4")
          fdTotal          = ((globals.get_int(Global_262145.f_17319) + fdOffset1 + fdOffset2) * fdStock)
          ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine();
          ImGui.ProgressBar((fdSupplies / 100), 240, 30)
          if fdSupplies < 100 then
            ImGui.SameLine()
            if ImGui.Button(" Fill Supplies ##fd") then
              globals.set_int(Global_1663174.f_4.f_1, 1)
            end
          end
          ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
          ImGui.ProgressBar((fdStock / 60), 240, 30,
            tostring(fdStock) .. " Boxes (" .. tostring(math.floor(fdStock / 6 * 10)) .. "%)")
          ImGui.SameLine(); ImGui.Text("Value:"); ImGui.SameLine();
          ImGui.Text("¤ Blaine County:  " ..
            lua_Fn.formatMoney(fdTotal) .. "\n¤ Los Santos:      " .. lua_Fn.formatMoney(math.floor(fdTotal * 1.5)))
        else
          ImGui.Text("You don't own a Document Forgery office.")
        end

        ImGui.SeparatorText("Acid Lab")
        if acidOwned then
          acidUpdgrade, auUsed = ImGui.Checkbox("Lab Upgrade##acid", acidUpdgrade)
          if auUsed then
            UI.widgetSound("Nav2")
            lua_cfg.save("acidUpdgrade", acidUpdgrade)
          end
          if acidUpdgrade then
            acidOffset = globals.get_int(Global_262145.f_17330)
          else
            acidOffset = 0
          end
          local acidSupplies = stats.get_int(MPx .. "_MATTOTALFORFACTORY6")
          local acidStock    = stats.get_int(MPx .. "_PRODTOTALFORFACTORY6")
          acidTotal          = ((globals.get_int(Global_262145.f_17324) + acidOffset) * acidStock)
          ImGui.BulletText("Supplies:"); ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine();
          ImGui.ProgressBar((acidSupplies / 100), 240, 30)
          if acidSupplies < 100 then
            ImGui.SameLine()
            if ImGui.Button(" Fill Supplies ##acid") then
              globals.set_int(Global_1663174.f_6.f_1, 1)
            end
          end
          ImGui.BulletText("Stock:"); ImGui.SameLine(); ImGui.Dummy(33, 1); ImGui.SameLine();
          ImGui.ProgressBar((acidStock / 160), 240, 30,
            tostring(acidStock) .. " Sheets (" .. tostring(math.floor(acidStock / 16 * 10)) .. "%)")
          ImGui.SameLine(); ImGui.Text("Value: " .. lua_Fn.formatMoney(acidTotal))
        else
          ImGui.Text("You don't own a Document Forgery office.")
        end

        ImGui.Separator(); ImGui.Spacing(); ImGui.Text("Total MC Business Value: " ..
          lua_Fn.formatMoney(fcashTotal + cokeTotal + methTotal + weedTotal + fdTotal + acidTotal))

        ------------------------MC Quick TP------------------------------
        if Game.Self.isOutside() then
          ImGui.Spacing(); ImGui.SeparatorText("Quick Teleport")
          ImGui.BeginDisabled(not fCashOwned)
          if ImGui.Button("To Cash Factory") then
            UI.widgetSound("Select")
            script.run_in_fiber(function()
              local fc_blip = HUD.GET_FIRST_BLIP_INFO_ID(500)
              local fc_coords
              if HUD.DOES_BLIP_EXIST(fc_blip) then
                fc_coords = HUD.GET_BLIP_COORDS(fc_blip)
                Game.Self.teleport(false, fc_coords)
              end
            end)
          end
          ImGui.EndDisabled()
          UI.helpMarker(true, translateLabel("tp_warn"), "#FFA134", 1)
          ImGui.SameLine()
          ImGui.BeginDisabled(not cokeOwned)
          if ImGui.Button("To Cocaine Lockup") then
            UI.widgetSound("Select")
            script.run_in_fiber(function()
              local c_blip = HUD.GET_FIRST_BLIP_INFO_ID(497)
              local c_coords
              if HUD.DOES_BLIP_EXIST(c_blip) then
                c_coords = HUD.GET_BLIP_COORDS(c_blip)
                Game.Self.teleport(false, c_coords)
              end
            end)
          end
          ImGui.EndDisabled()
          UI.helpMarker(true, translateLabel("tp_warn"), "#FFA134", 1)
          ImGui.SameLine()
          ImGui.BeginDisabled(not methOwned)
          if ImGui.Button("To Meth Lab") then
            UI.widgetSound("Select")
            script.run_in_fiber(function()
              local m_blip = HUD.GET_FIRST_BLIP_INFO_ID(499)
              local m_coords
              if HUD.DOES_BLIP_EXIST(m_blip) then
                m_coords = HUD.GET_BLIP_COORDS(m_blip)
                Game.Self.teleport(false, m_coords)
              end
            end)
          end
          ImGui.EndDisabled()
          UI.helpMarker(true, translateLabel("tp_warn"), "#FFA134", 1)
          ImGui.BeginDisabled(not weedOwned)
          if ImGui.Button("To Weed Lockup") then
            UI.widgetSound("Select")
            script.run_in_fiber(function()
              local w_blip = HUD.GET_FIRST_BLIP_INFO_ID(496)
              local w_coords
              if HUD.DOES_BLIP_EXIST(w_blip) then
                w_coords = HUD.GET_BLIP_COORDS(w_blip)
                Game.Self.teleport(false, w_coords)
              end
            end)
          end
          ImGui.EndDisabled()
          UI.helpMarker(true, translateLabel("tp_warn"), "#FFA134", 1)
          ImGui.SameLine()
          ImGui.BeginDisabled(not fdOwned)
          if ImGui.Button("To Document Forgery") then
            UI.widgetSound("Select")
            script.run_in_fiber(function()
              local fd_blip = HUD.GET_FIRST_BLIP_INFO_ID(498)
              local fd_coords
              if HUD.DOES_BLIP_EXIST(fd_blip) then
                fd_coords = HUD.GET_BLIP_COORDS(fd_blip)
                Game.Self.teleport(false, fd_coords)
              end
            end)
          end
          ImGui.EndDisabled()
          UI.helpMarker(true, translateLabel("tp_warn"), "#FFA134", 1)
          ImGui.SameLine()
          ImGui.BeginDisabled(not acidOwned)
          if ImGui.Button("To Acid Lab") then
            UI.widgetSound("Select")
            script.run_in_fiber(function()
              local acid_blip = HUD.GET_FIRST_BLIP_INFO_ID(848)
              local acid_coords
              if HUD.DOES_BLIP_EXIST(acid_blip) then
                acid_coords = HUD.GET_BLIP_COORDS(acid_blip)
                Game.Self.teleport(false, acid_coords)
              end
            end)
          end
          ImGui.EndDisabled()
          UI.helpMarker(true, translateLabel("tp_warn"), "#FFA134", 1)
        end
        ImGui.EndTabItem()
      end
      if ImGui.BeginTabItem("Safes") then
        ImGui.Dummy(1, 10)

        if stats.get_int(MPx .. "_PROP_NIGHTCLUB") ~= 0 then
          ImGui.Spacing(); ImGui.SeparatorText("Nightclub")
          local currentNcPop    = stats.get_int(MPx .. "_CLUB_POPULARITY")
          local popDiff         = 1000 - currentNcPop
          local currNcSafeMoney = stats.get_int(MPx .. "_CLUB_SAFE_CASH_VALUE")
          ImGui.BulletText("Popularity: "); ImGui.SameLine(); ImGui.Dummy(18, 1); ImGui.SameLine();
          ImGui.ProgressBar(currentNcPop / 1000, 240, 30, tostring(currentNcPop))
          if currentNcPop < 1000 then
            ImGui.SameLine()
            if ImGui.Button("Max Popularity") then
              UI.widgetSound("Select")
              stats.set_int(MPx .. "_CLUB_POPULARITY", currentNcPop + popDiff)
              gui.show_success("Samurai's Scripts", "Nightclub popularity increased.")
            end
          end
          ImGui.BulletText("Safe: "); ImGui.SameLine(); ImGui.Dummy(60, 1); ImGui.SameLine();
          ImGui.ProgressBar(currNcSafeMoney / 250000, 240, 30, lua_Fn.formatMoney(currNcSafeMoney))
          if Game.Self.isOutside() then
            ImGui.SameLine()
            if ImGui.Button("Teleport##nc") then
              UI.widgetSound("Select")
              script.run_in_fiber(function()
                local ncBlip = HUD.GET_FIRST_BLIP_INFO_ID(614)
                local ncLoc
                if HUD.DOES_BLIP_EXIST(ncBlip) then
                  ncLoc = HUD.GET_BLIP_COORDS(ncBlip)
                  Game.Self.teleport(false, ncLoc)
                end
              end)
            end
          end
        end

        if stats.get_int(MPx .. "_PROP_ARCADE") ~= 0 then
          ImGui.Spacing()
          ImGui.SeparatorText("Arcade")
          local currArSafeMoney = stats.get_int(MPx .. "_ARCADE_SAFE_CASH_VALUE")
          ImGui.BulletText("Safe: ")
          ImGui.SameLine(); ImGui.Dummy(60, 1); ImGui.SameLine();
          ImGui.ProgressBar(currArSafeMoney / 100000, 240, 30, lua_Fn.formatMoney(currArSafeMoney))
          if Game.Self.isOutside() then
            ImGui.SameLine()
            if ImGui.Button("Teleport##arcade") then
              UI.widgetSound("Select")
              script.run_in_fiber(function()
                local arBlip = HUD.GET_FIRST_BLIP_INFO_ID(740)
                local arLoc
                if HUD.DOES_BLIP_EXIST(arBlip) then
                  arLoc = HUD.GET_BLIP_COORDS(arBlip)
                  Game.Self.teleport(false, arLoc)
                end
              end)
            end
          end
        end

        if stats.get_int(MPx .. "_PROP_SECURITY_OFFICE") ~= 0 then
          ImGui.Spacing(); ImGui.SeparatorText("Agency")
          local currAgSafeMoney = stats.get_int(MPx .. "_FIXER_SAFE_CASH_VALUE")
          ImGui.BulletText("Safe: "); ImGui.SameLine(); ImGui.Dummy(60, 1); ImGui.SameLine();
          ImGui.ProgressBar(currAgSafeMoney / 250000, 240, 30, lua_Fn.formatMoney(currAgSafeMoney))
          if Game.Self.isOutside() then
            ImGui.SameLine()
            if ImGui.Button("Teleport##agnc") then
              UI.widgetSound("Select")
              script.run_in_fiber(function()
                local agncBlip = HUD.GET_FIRST_BLIP_INFO_ID(826)
                local agncLoc
                if HUD.DOES_BLIP_EXIST(agncBlip) then
                  agncLoc = HUD.GET_BLIP_COORDS(agncBlip)
                  Game.Self.teleport(false, agncLoc)
                end
              end)
            end
          end
        end

        if stats.get_int(MPx .. "_PROP_CLUBHOUSE") ~= 0 then
          ImGui.Spacing(); ImGui.SeparatorText("MC Clubhouse")
          local currClubHouseBarProfit = stats.get_int(MPx .. "_BIKER_BAR_RESUPPLY_CASH")
          ImGui.BulletText("Bar Earnings:"); ImGui.SameLine(); ImGui.Dummy(2, 1); ImGui.SameLine();
          ImGui.ProgressBar(currClubHouseBarProfit / 100000, 240, 30, lua_Fn.formatMoney(currClubHouseBarProfit))
          if Game.Self.isOutside() then
            ImGui.SameLine()
            if ImGui.Button("Teleport##mc") then
              UI.widgetSound("Select")
              script.run_in_fiber(function()
                local mcBlip = HUD.GET_FIRST_BLIP_INFO_ID(492)
                local mcLoc
                if HUD.DOES_BLIP_EXIST(mcBlip) then
                  mcLoc = HUD.GET_BLIP_COORDS(mcBlip)
                  Game.Self.teleport(false, mcLoc)
                end
              end)
            end
          end
        end

        if stats.get_int(MPx .. "_PROP_BAIL_OFFICE") ~= 0 then
          ImGui.Spacing(); ImGui.SeparatorText("Bail Office")
          local currBailSafe = stats.get_int(MPx .. "_BAIL_SAFE_CASH_VALUE")
          ImGui.BulletText("Safe:"); ImGui.SameLine(); ImGui.Dummy(60, 1); ImGui.SameLine();
          ImGui.ProgressBar(currBailSafe / 100000, 240, 30, lua_Fn.formatMoney(currBailSafe))
          if Game.Self.isOutside() then
            ImGui.SameLine()
            if ImGui.Button("Teleport##bail") then
              UI.widgetSound("Select")
              script.run_in_fiber(function()
                local bailBlip = HUD.GET_FIRST_BLIP_INFO_ID(893)
                local bailLoc
                if HUD.DOES_BLIP_EXIST(bailBlip) then
                  bailLoc   = HUD.GET_BLIP_COORDS(bailBlip)
                  bailLoc.y = bailLoc.y + 1.2
                  Game.Self.teleport(false, bailLoc)
                end
              end)
            end
          end
        end

        if stats.get_int(MPx .. "_SALVAGE_YARD_OWNED") ~= 0 then
          ImGui.Spacing(); ImGui.SeparatorText("Salvage Yard")
          local currSalvSafe = stats.get_int(MPx .. "_SALVAGE_SAFE_CASH_VALUE")
          ImGui.BulletText("Safe: "); ImGui.SameLine(); ImGui.Dummy(60, 1); ImGui.SameLine();
          ImGui.ProgressBar(currSalvSafe / 250000, 240, 30, lua_Fn.formatMoney(currSalvSafe))
          if Game.Self.isOutside() then
            ImGui.SameLine()
            if ImGui.Button("Teleport##salvage") then
              UI.widgetSound("Select")
              script.run_in_fiber(function()
                local slvgBlip = HUD.GET_FIRST_BLIP_INFO_ID(867)
                local slvgLoc
                if HUD.DOES_BLIP_EXIST(slvgBlip) then
                  slvgLoc = HUD.GET_BLIP_COORDS(slvgBlip)
                  Game.Self.teleport(false, slvgLoc)
                end
              end)
            end
          end
        end
        if Game.Self.isOutside() then
          ImGui.Dummy(1, 10); UI.coloredText(translateLabel("tp_warn_2"), "#FFA134", 1, 40)
        end
        ImGui.EndTabItem()
      end

      if ImGui.BeginTabItem("Cooldowns") then
        ImGui.Dummy(1, 5)
        mc_work_cd, mcworkUsed = ImGui.Checkbox("MC Club Work", mc_work_cd)
        if mcworkUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("mc_work_cd", mc_work_cd)
        end

        ImGui.SameLine(); ImGui.Dummy(58, 1); ImGui.SameLine()
        hangar_cd, hcdUsed = ImGui.Checkbox("Hangar Crate Steal", hangar_cd)
        if hcdUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("hangar_cd", hangar_cd)
        end

        nc_management_cd, ncmanagementUsed = ImGui.Checkbox("Nightclub Management", nc_management_cd)
        if ncmanagementUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("nc_management_cd", nc_management_cd)
        end

        ImGui.SameLine()
        nc_vip_mission_chance, nvipmcUsed = ImGui.Checkbox("Always Troublemaker", nc_vip_mission_chance)
        UI.helpMarker(false,
          "Always spawns the troublemaker nightclub missions and disables the knocked out VIP missions.")
        if nvipmcUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("nc_vip_mission_chance", nc_vip_mission_chance)
        end

        ie_vehicle_steal_cd, ievstealUsed = ImGui.Checkbox("I/E Vehicle Sourcing", ie_vehicle_steal_cd)
        if ievstealUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("ie_vehicle_steal_cd", ie_vehicle_steal_cd)
        end

        ImGui.SameLine(); ImGui.Dummy(12, 1); ImGui.SameLine()
        ie_vehicle_sell_cd, ievsellUsed = ImGui.Checkbox("I/E Vehicle Selling", ie_vehicle_sell_cd)
        if ievsellUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("ie_vehicle_sell_cd", ie_vehicle_sell_cd)
        end

        ceo_crate_buy_cd, ceobUsed = ImGui.Checkbox("CEO Crate Buy", ceo_crate_buy_cd)
        if ceobUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("ceo_crate_buy_cd", ceo_crate_buy_cd)
        end

        ImGui.SameLine(); ImGui.Dummy(55, 1); ImGui.SameLine()
        ceo_crate_sell_cd, ceosUsed = ImGui.Checkbox("CEO Crate Sell", ceo_crate_sell_cd)
        if ceosUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("ceo_crate_sell_cd", ceo_crate_sell_cd)
        end

        security_missions_cd, smcdUsed = ImGui.Checkbox("Security Missions", security_missions_cd)
        if smcdUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("security_missions_cd", security_missions_cd)
        end

        ImGui.SameLine(); ImGui.Dummy(29, 1); ImGui.SameLine()
        ImGui.BeginDisabled()
        payphone_hits_cd, _ = ImGui.Checkbox("Payphone Hits [x]", payphone_hits_cd)
        ImGui.EndDisabled()
        UI.toolTip(false, "Use ShinyWasabi's Payphone Hits script instead.")

        ImGui.Dummy(1, 5)
        if mc_work_cd and hangar_cd and nc_management_cd and nc_vip_mission_chance and security_missions_cd and ie_vehicle_steal_cd and ie_vehicle_sell_cd and ceo_crate_buy_cd and ceo_crate_sell_cd then
          if ImGui.Button("Uncheck All", 120, 40) then
            UI.widgetSound("Cancel")
            mc_work_cd            = false
            hangar_cd             = false
            nc_management_cd      = false
            nc_vip_mission_chance = false
            security_missions_cd  = false
            ie_vehicle_steal_cd   = false
            ie_vehicle_sell_cd    = false
            ceo_crate_buy_cd      = false
            ceo_crate_sell_cd     = false
            lua_cfg.save("mc_work_cd", mc_work_cd)
            lua_cfg.save("hangar_cd", hangar_cd)
            lua_cfg.save("nc_management_cd", nc_management_cd)
            lua_cfg.save("nc_vip_mission_chance", nc_vip_mission_chance)
            lua_cfg.save("security_missions_cd", security_missions_cd)
            lua_cfg.save("ie_vehicle_steal_cd", ie_vehicle_steal_cd)
            lua_cfg.save("ie_vehicle_sell_cd", ie_vehicle_sell_cd)
            lua_cfg.save("ceo_crate_buy_cd", ceo_crate_buy_cd)
            lua_cfg.save("ceo_crate_sell_cd", ceo_crate_sell_cd)
          end
        else
          if ImGui.Button("Check All", 120, 40) then
            UI.widgetSound("Select")
            mc_work_cd            = true
            hangar_cd             = true
            nc_management_cd      = true
            nc_vip_mission_chance = true
            security_missions_cd  = true
            ie_vehicle_steal_cd   = true
            ie_vehicle_sell_cd    = true
            ceo_crate_buy_cd      = true
            ceo_crate_sell_cd     = true
            lua_cfg.save("mc_work_cd", mc_work_cd)
            lua_cfg.save("hangar_cd", hangar_cd)
            lua_cfg.save("nc_management_cd", nc_management_cd)
            lua_cfg.save("nc_vip_mission_chance", nc_vip_mission_chance)
            lua_cfg.save("security_missions_cd", security_missions_cd)
            lua_cfg.save("ie_vehicle_steal_cd", ie_vehicle_steal_cd)
            lua_cfg.save("ie_vehicle_sell_cd", ie_vehicle_sell_cd)
            lua_cfg.save("ceo_crate_buy_cd", ceo_crate_buy_cd)
            lua_cfg.save("ceo_crate_sell_cd", ceo_crate_sell_cd)
          end
        end
        ImGui.Spacing(); ImGui.SeparatorText("Sell Missions")
        ImGui.Spacing(); UI.wrappedText(
          "These options will not be saved. Each button disables the most tedious sell missions for that business.", 32)
        ImGui.Spacing(); UI.coloredText(
          "[ ! ] NOTE: If you plan on selling more than once for the same business (example: MC businesses or more than one CEO warehouse), please switch sessions after finishing the first sale to reset the missions, otherwise a sesond sell mission may fail to start.",
          'yellow', 0.69, 32)

        if ImGui.Button("Easy Biker Sell Missions") then
          UI.widgetSound("Select")
          for _, index in pairs(mc_sell_mission_types_T) do
            if globals.get_int(index) == 0 then
              globals.set_int(index, 1)
            end
          end
          gui.show_success("Samurai's Scripts", "Successfully disabled the most annoying missions.")
        end

        ImGui.SameLine(); ImGui.Dummy(41, 1); ImGui.SameLine()
        if ImGui.Button("Easy CEO Sell Missions") then
          UI.widgetSound("Select")
          for _, index in pairs(ceo_sell_mission_types_T) do
            if globals.get_int(index) == 0 then
              globals.set_int(index, 1)
            end
          end
          gui.show_success("Samurai's Scripts", "Successfully disabled the most annoying missions.")
        end

        if ImGui.Button("Easy Nightclub Sell Missions") then
          UI.widgetSound("Select")
          for _, index in pairs(nc_sell_mission_types_T) do
            if globals.get_int(index) > 0.0 then
              globals.set_int(index, 0.0)
            end
          end
          gui.show_success("Samurai's Scripts", "Successfully disabled the most annoying missions.")
        end

        ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine()
        if ImGui.Button("Easy Hangar Sell Missions") then
          UI.widgetSound("Select")
          for _, index in pairs(hg_sell_mission_types_T) do
            if globals.get_int(index) > 0.0 then
              globals.set_int(index, 0.0)
            end
          end
          gui.show_success("Samurai's Scripts", "Successfully disabled the most annoying missions.")
        end
        ImGui.EndTabItem()
      end
      if ImGui.BeginTabItem(" ? ") then
        ImGui.Dummy(1, 10); ImGui.SeparatorText("About")
        ImGui.Spacing(); UI.wrappedText(
          "This script was developed to be as non-conspicuous as possible. Sure, using any form of cheating already carries a ban risk but there is a difference between simply filling your supplies ONLY when they are below max, and giving you a shit ton of money for just standing there like a bot or allowing you to sell a product for an unreasonable amount of money that is easily detectable.\10\10Therefore, this section will never have any money loops, instant sales or anything of the sort. This is meant for solo grinders: fill your supplies then go do some awesome drifts, street races, dogfights or whatever is your favorite GTAO thing to do while you wait for your stocks to fill up and once they do, sell them by actually playing the missions. You can teleport to finish sell missions quicker but make sure you're in a locked solo session before doing so.",
          30
        )
        ImGui.EndTabItem()
      end
      ImGui.EndTabBar()
    else
      ImGui.Dummy(1, 5); ImGui.SameLine(); ImGui.Text("Outdated.")
    end
  else
    ImGui.Dummy(1, 5); ImGui.Text(translateLabel("Unavailable in Single Player"))
  end
end)

-- Casino
casino_pacino                         = online_tab:add_tab("Casino Pacino ") --IT'S NOT AL ANYMORE! IT'S DUNK!
blackjack_cards                       = 116
blackjack_decks                       = 846
blackjack_table_players               = 1776
blackjack_table_players_size          = 8
three_card_poker_table                = 749
three_card_poker_table_size           = 9
three_card_poker_cards                = 116
three_card_poker_current_deck         = 168
three_card_poker_anti_cheat           = 1038
three_card_poker_anti_cheat_deck      = 799
three_card_poker_deck_size            = 55
roulette_master_table                 = 124
roulette_outcomes_table               = 1357
roulette_ball_table                   = 153
slots_random_results_table            = 1348
slots_slot_machine_state              = 1638
prize_wheel_win_state                 = 280
prize_wheel_prize                     = 14
prize_wheel_prize_state               = 45
gb_casino_heist_planning              = 1964849
gb_casino_heist_planning_cut_offset   = 1497 + 736 + 92
fm_mission_controller_cart_grab       = 10255
fm_mission_controller_cart_grab_speed = 14
casino_heist_approach                 = 0
casino_heist_target                   = 0
casino_heist_last_approach            = 0
casino_heist_hard                     = 0
casino_heist_gunman                   = 0
casino_heist_driver                   = 0
casino_heist_hacker                   = 0
casino_heist_weapons                  = 0
casino_heist_cars                     = 0
casino_heist_masks                    = 0
new_approach                          = 0
new_target                            = 0
new_last_approach                     = 0
new_hard_approach                     = 0
new_gunman                            = 0
new_weapons                           = 0
new_driver                            = 0
new_car                               = 0
new_hacker                            = 0
new_masks                             = 0
casino_cooldown_update_str            = ""
dealers_card_str                      = ""
heist_cart_autograb                   = lua_cfg.read("heist_cart_autograb")
bypass_casino_bans                    = lua_cfg.read("bypass_casino_bans")
force_poker_cards                     = lua_cfg.read("bypass_casino_bans")
set_dealers_poker_cards               = lua_cfg.read("bypass_casino_bans")
force_roulette_wheel                  = lua_cfg.read("force_roulette_wheel")
rig_slot_machine                      = lua_cfg.read("rig_slot_machine")
autoplay_slots                        = lua_cfg.read("autoplay_slots")
autoplay_cap                          = lua_cfg.read("autoplay_cap")
autoplay_chips_cap                    = lua_cfg.read("autoplay_chips_cap")

local function set_poker_cards(player_id, players_current_table, card_one, card_two, card_three)
  locals.set_int("three_card_poker",
    (three_card_poker_cards) + (three_card_poker_current_deck) +
    (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (1) + (player_id * 3), card_one)
  locals.set_int("three_card_poker",
    (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) +
    (1 + (players_current_table * three_card_poker_deck_size)) + (1) + (player_id * 3), card_one)
  locals.set_int("three_card_poker",
    (three_card_poker_cards) + (three_card_poker_current_deck) +
    (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (2) + (player_id * 3), card_two)
  locals.set_int("three_card_poker",
    (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) +
    (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (player_id * 3), card_two)
  locals.set_int("three_card_poker",
    (three_card_poker_cards) + (three_card_poker_current_deck) +
    (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (3) + (player_id * 3), card_three)
  locals.set_int("three_card_poker",
    (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) +
    (1 + (players_current_table * three_card_poker_deck_size)) + (3) + (player_id * 3), card_three)
end

local function get_cardname_from_index(card_index)
  if card_index == 0 then
    return "Rolling"
  end

  local card_number = math.fmod(card_index, 13)
  local cardName = ""
  local cardSuit = ""

  if card_number == 1 then
    cardName = "Ace"
  elseif card_number == 11 then
    cardName = "Jack"
  elseif card_number == 12 then
    cardName = "Queen"
  elseif card_number == 0 then
    cardName = "King"
  else
    cardName = tostring(card_number)
  end

  if card_index >= 1 and card_index <= 13 then
    cardSuit = "Clubs"
  elseif card_index >= 14 and card_index <= 26 then
    cardSuit = "Diamonds"
  elseif card_index >= 27 and card_index <= 39 then
    cardSuit = "Hearts"
  elseif card_index >= 40 and card_index <= 52 then
    cardSuit = "Spades"
  end

  return cardName .. " of " .. cardSuit
end

casino_pacino:add_imgui(function()
  if Game.isOnline() then
    if CURRENT_BUILD == TARGET_BUILD then
      ImGui.BeginTabBar("Dunk Pacino")
      if ImGui.BeginTabItem(translateLabel("Gambling")) then
        bypass_casino_bans, bcbUsed = ImGui.Checkbox(translateLabel("bypassCasinoCooldownCB"), bypass_casino_bans)
        if bcbUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("bypass_casino_bans", bypass_casino_bans)
        end
        if not bypass_casino_bans then
          UI.toolTip(true, translateLabel("casinoCDwarn"), "#FFCC00", 1)
        end

        ImGui.Spacing(); ImGui.Text(translateLabel("casinoCDstatus")); ImGui.SameLine()
        ImGui.BulletText(casino_cooldown_update_str)

        ImGui.Spacing(); ImGui.SeparatorText("Poker")
        force_poker_cards, fpcUsed = ImGui.Checkbox(translateLabel("forcePokerCardsCB"), force_poker_cards)
        if fpcUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("force_poker_cards", force_poker_cards)
        end

        set_dealers_poker_cards, sdpcUsed = ImGui.Checkbox(translateLabel("setDealersCardsCB"), set_dealers_poker_cards)
        if sdpcUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("set_dealers_poker_cards", set_dealers_poker_cards)
        end

        ImGui.Spacing(); ImGui.SeparatorText("Blackjack")
        ImGui.Spacing(); ImGui.BulletText(translateLabel("faceDownCard")); ImGui.SameLine(); ImGui.Text(dealers_card_str); ImGui
            .Spacing()
        if ImGui.Button(translateLabel("dealerBustBtn")) then
          UI.widgetSound("Select")
          script.run_in_fiber(function(script)
            local player_id = PLAYER.PLAYER_ID()
            while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 3, 0) ~= player_id do
              network.force_script_host("blackjack")
              gui.show_message("CasinoPacino", "Taking control of the blackjack script.") --If you see this spammed, someone is fighting you for control.
              script:yield()
            end
            local blackjack_table = locals.get_int("blackjack",
              blackjack_table_players + 1 + (player_id * blackjack_table_players_size) + 4) --The Player's current table he is sitting at.
            if blackjack_table ~= -1 then
              locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 1, 11)
              locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 2, 12)
              locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 3, 13)
              locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 12, 3)
            end
          end)
        end

        ImGui.Spacing(); ImGui.SeparatorText("Roulette")
        force_roulette_wheel, frwUsed = ImGui.Checkbox(translateLabel("forceRouletteCB"), force_roulette_wheel)
        if frwUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("force_roulette_wheel", force_roulette_wheel)
        end

        ImGui.Spacing(); ImGui.SeparatorText("Slot Machines")
        rig_slot_machine, rsmUsed = ImGui.Checkbox(translateLabel("rigSlotsCB"), rig_slot_machine)
        if rsmUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("rig_slot_machine", rig_slot_machine)
        end

        autoplay_slots, apsUsed = ImGui.Checkbox(translateLabel("autoplaySlotsCB"), autoplay_slots); ImGui
            .SameLine()
        if apsUsed then
          UI.widgetSound("Nav2")
          lua_cfg.save("autoplay_slots", autoplay_slots)
        end
        if autoplay_slots then
          autoplay_cap, apcapUsed = ImGui.Checkbox(translateLabel("autoplayCapCB"), autoplay_cap); ImGui.SameLine()
          if apcapUsed then
            UI.widgetSound("Nav2")
            lua_cfg.save("autoplay_cap", autoplay_cap)
          end
          if autoplay_cap then
            ImGui.PushItemWidth(200)
            autoplay_chips_cap, chipsCapUsed = ImGui.InputInt("##chips_cap", autoplay_chips_cap, 1000, 100000,
              ImGuiInputTextFlags.CharsDecimal)
            ImGui.PopItemWidth()
            if chipsCapUsed then
              UI.widgetSound("Nav2")
              lua_cfg.save("autoplay_chips_cap", autoplay_chips_cap)
            end
          end
        end

        ImGui.Spacing(); ImGui.SeparatorText("Lucky Wheel")
        if ImGui.Button(translateLabel("podiumVeh_Btn")) then
          script.run_in_fiber(function()
            if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
              UI.widgetSound("Select")
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 18)
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11)
            else
              UI.widgetSound("Error")
            end
          end)
        end
        ImGui.SameLine()
        if ImGui.Button(translateLabel("mysteryPrize_Btn")) then
          script.run_in_fiber(function()
            if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
              UI.widgetSound("Select")
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 11)
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11)
            else
              UI.widgetSound("Error")
            end
          end)
        end

        ImGui.SameLine()
        if ImGui.Button(translateLabel("50k_Btn")) then
          script.run_in_fiber(function()
            if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
              UI.widgetSound("Select")
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 19)
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11)
            else
              UI.widgetSound("Error")
            end
          end)
        end

        if ImGui.Button(translateLabel("25k_Btn")) then
          script.run_in_fiber(function()
            if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
              UI.widgetSound("Select")
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 15)
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11)
            else
              UI.widgetSound("Error")
            end
          end)
        end

        ImGui.SameLine(); ImGui.Dummy(6, 1); ImGui.SameLine()
        if ImGui.Button(translateLabel("15k_Btn")) then
          script.run_in_fiber(function()
            if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
              UI.widgetSound("Select")
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 17)
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11)
            else
              UI.widgetSound("Error")
            end
          end)
        end

        ImGui.SameLine(); ImGui.Dummy(21, 1); ImGui.SameLine()
        if ImGui.Button(translateLabel("%_Btn")) then
          script.run_in_fiber(function()
            if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
              UI.widgetSound("Select")
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 4)
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11)
            else
              UI.widgetSound("Error")
            end
          end)
        end

        if ImGui.Button(translateLabel("clothing_Btn")) then
          script.run_in_fiber(function()
            if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
              UI.widgetSound("Select")
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 8)
              locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11)
            else
              UI.widgetSound("Error")
            end
          end)
        end
        ImGui.EndTabItem()
      end
      if ImGui.BeginTabItem("Casino Heist") then
        ImGui.PushItemWidth(165)
        new_approach, approach_clicked = ImGui.Combo(translateLabel("approach"), casino_heist_approach,
          { "Unselected", "Silent & Sneaky", "The Big Con", "Aggressive" }, 4) --You gotta sneak the word in there, like you're sneaking in food to a movie theater. Tuck it in your jacket for later, then when they least suspect it, deploy the word.
        if approach_clicked then
          script.run_in_fiber(function()
            stats.set_int("MPX_H3OPT_APPROACH", new_approach)
          end)
        end
        ImGui.SameLine(); ImGui.Dummy(24, 0); ImGui.SameLine()
        local new_target, target_clicked = ImGui.Combo(translateLabel("target"), casino_heist_target,
          { "Money", "Gold", "Art", "Diamonds" }, 4)
        if target_clicked then
          script.run_in_fiber(function()
            stats.set_int("MPX_H3OPT_TARGET", new_target)
          end)
        end
        local new_last_approach, last_approach_clicked = ImGui.Combo(translateLabel("last_approach"),
          casino_heist_last_approach, { "Unselected", "Silent & Sneaky", "The Big Con", "Aggressive" }, 4)
        if last_approach_clicked then
          script.run_in_fiber(function()
            stats.set_int("MPX_H3_LAST_APPROACH", new_last_approach)
          end)
        end
        ImGui.SameLine()
        local new_hard_approach, hard_approach_clicked = ImGui.Combo(translateLabel("hard_approach"), casino_heist_hard,
          { "Unselected", "Silent & Sneaky", "The Big Con", "Aggressive" }, 4)
        if hard_approach_clicked then
          script.run_in_fiber(function()
            stats.set_int("MPX_H3_HARD_APPROACH", new_hard_approach)
          end)
        end
        ImGui.PopItemWidth()

        ImGui.Spacing()
        ImGui.PushItemWidth(165)
        local new_gunman, gunman_clicked = ImGui.Combo(translateLabel("gunman"), casino_heist_gunman,
          { "Unselected", "Karl Abolaji", "Gustavo Mota", "Charlie Reed", "Chester McCoy", "Patrick McReary" }, 6)
        if gunman_clicked then
          script.run_in_fiber(function()
            stats.set_int("MPX_H3OPT_CREWWEAP", new_gunman)
          end)
        end
        if casino_heist_gunman == 1 then --Karl Abolaji
          ImGui.SameLine(); ImGui.Dummy(31, 1); ImGui.SameLine()
          local karl_gun_list = { { '##1", "##2' }, { "Micro SMG Loadout", "Machine Pistol Loadout" }, { "Micro SMG Loadout", "Shotgun Loadout" }, { "Shotgun Loadout", "Revolver Loadout" } }
          local new_weapons, weapons_clicked = ImGui.Combo(translateLabel("unmarked_weapons"), casino_heist_weapons,
            karl_gun_list[casino_heist_approach + 1], 2)
          if weapons_clicked then
            script.run_in_fiber(function()
              stats.set_int("MPX_H3OPT_WEAPS", new_weapons)
            end)
          end
        elseif casino_heist_gunman == 2 then --Gustavo Fring
          ImGui.SameLine(); ImGui.Dummy(31, 1); ImGui.SameLine()
          local new_weapons, weapons_clicked = ImGui.Combo(translateLabel("unmarked_weapons"), casino_heist_weapons,
            { "Rifle Loadout", "Shotgun Loadout" }, 2)
          if weapons_clicked then
            script.run_in_fiber(function()
              stats.set_int("MPX_H3OPT_WEAPS", new_weapons)
            end)
          end
        elseif casino_heist_gunman == 3 then --Charlie Reed
          ImGui.SameLine(); ImGui.Dummy(31, 1); ImGui.SameLine()
          local charlie_gun_list = { { '##1", "##2' }, { "SMG Loadout", "Shotgun Loadout" }, { "Machine Pistol Loadout", "Shotgun Loadout" }, { "SMG Loadout", "Shotgun Loadout" } }
          local new_weapons, weapons_clicked = ImGui.Combo(translateLabel("unmarked_weapons"), casino_heist_weapons,
            charlie_gun_list[casino_heist_approach + 1], 2)
          if weapons_clicked then
            script.run_in_fiber(function()
              stats.set_int("MPX_H3OPT_WEAPS", new_weapons)
            end)
          end
        elseif casino_heist_gunman == 4 then --Chester McCoy
          ImGui.SameLine(); ImGui.Dummy(31, 1); ImGui.SameLine()
          local chester_gun_list = { { '##1", "##2' }, { "MK II Shotgun Loadout", "MK II Rifle Loadout" }, { "MK II SMG Loadout", "MK II Rifle Loadout" }, { "MK II Shotgun Loadout", "MK II Rifle Loadout" } }
          local new_weapons, weapons_clicked = ImGui.Combo(translateLabel("unmarked_weapons"), casino_heist_weapons,
            chester_gun_list[casino_heist_approach + 1], 2)
          if weapons_clicked then
            script.run_in_fiber(function()
              stats.set_int("MPX_H3OPT_WEAPS", new_weapons)
            end)
          end
        elseif casino_heist_gunman == 5 then --Laddie Paddie Sadie Enweird
          ImGui.SameLine(); ImGui.Dummy(31, 1); ImGui.SameLine()
          local laddie_paddie_gun_list = { { '##1", "##2' }, { "Combat PDW Loadout", "Rifle Loadout" }, { "Shotgun Loadout", "Rifle Loadout" }, { "Shotgun Loadout", "Combat MG Loadout" } }
          local new_weapons, weapons_clicked = ImGui.Combo(translateLabel("unmarked_weapons"), casino_heist_weapons,
            laddie_paddie_gun_list[casino_heist_approach + 1], 2)
          if weapons_clicked then
            script.run_in_fiber(function()
              stats.set_int("MPX_H3OPT_WEAPS", new_weapons)
            end)
          end
        end

        local new_driver, driver_clicked = ImGui.Combo(translateLabel("driver"), casino_heist_driver,
          { "Unselected", "Karim Deniz", "Taliana Martinez", "Eddie Toh", "Zach Nelson", "Chester McCoy" }, 6)
        if driver_clicked then
          script.run_in_fiber(function()
            stats.set_int("MPX_H3OPT_CREWDRIVER", new_driver)
          end)
        end

        if casino_heist_driver == 1 then --Karim Deniz
          ImGui.SameLine(); ImGui.Dummy(50, 1); ImGui.SameLine()
          local new_car, car_clicked = ImGui.Combo(translateLabel("getaways"), casino_heist_cars,
            { "Issi Classic", "Asbo", "Kanjo", "Sentinel Classic" }, 4)
          if car_clicked then
            script.run_in_fiber(function()
              stats.set_int("MPX_H3OPT_VEHS", new_car)
            end)
          end
        elseif casino_heist_driver == 2 then --Taliana Martinez
          ImGui.SameLine(); ImGui.Dummy(50, 1); ImGui.SameLine()
          local new_car, car_clicked = ImGui.Combo(translateLabel("getaways"), casino_heist_cars,
            { "Retinue MK II", "Drift Yosemite", "Sugoi", "Jugular" }, 4)
          if car_clicked then
            script.run_in_fiber(function()
              stats.set_int("MPX_H3OPT_VEHS", new_car)
            end)
          end
        elseif casino_heist_driver == 3 then --Eddie Toh
          ImGui.SameLine(); ImGui.Dummy(50, 1); ImGui.SameLine()
          local new_car, car_clicked = ImGui.Combo(translateLabel("getaways"), casino_heist_cars,
            { "Sultan Classic", "Guantlet Classic", "Ellie", "Komoda" }, 4)
          if car_clicked then
            script.run_in_fiber(function()
              stats.set_int("MPX_H3OPT_VEHS", new_car)
            end)
          end
        elseif casino_heist_driver == 4 then --Zach Nelson
          ImGui.SameLine(); ImGui.Dummy(50, 1); ImGui.SameLine()
          local new_car, car_clicked = ImGui.Combo(translateLabel("getaways"), casino_heist_cars,
            { "Manchez", "Stryder", "Defiler", "Lectro" }, 4)
          if car_clicked then
            script.run_in_fiber(function()
              stats.set_int("MPX_H3OPT_VEHS", new_car)
            end)
          end
        elseif casino_heist_driver == 5 then --Chester McCoy
          ImGui.SameLine(); ImGui.Dummy(50, 1); ImGui.SameLine()
          local new_car, car_clicked = ImGui.Combo(translateLabel("getaways"), casino_heist_cars,
            { "Zhaba", "Vagrant", "Outlaw", "Everon" }, 4)
          if car_clicked then
            script.run_in_fiber(function()
              stats.set_int("MPX_H3OPT_VEHS", new_car)
            end)
          end
        end

        local new_hacker, hacker_clicked = ImGui.Combo(translateLabel("hacker"), casino_heist_hacker,
          { "Unselected", "Rickie Lukens", "Christian Feltz", "Yohan Blair", "Avi Schwartzman", "Page Harris" }, 6)
        if hacker_clicked then
          script.run_in_fiber(function()
            stats.set_int("MPX_H3OPT_CREWHACKER", new_hacker)
          end)
        end

        local new_masks, masks_clicked = ImGui.Combo(translateLabel("masks"), casino_heist_masks,
          { "Unselected", "Geometric Set", "Hunter Set", "Oni Half Mask Set", "Emoji Set", "Ornate Skull Set",
            "Lucky Fruit Set", "Gurilla Set", "Clown Set", "Animal Set", "Riot Set", "Oni Set", "Hockey Set" }, 13)
        if masks_clicked then
          script.run_in_fiber(function()
            stats.set_int("MPX_H3OPT_MASKS", new_masks)
          end)
        end

        heist_cart_autograb, hcagUsed = ImGui.Checkbox(translateLabel("autograb"), heist_cart_autograb)
        if hcagUsed then
          UI.widgetSound("Nav2")
          lua_cgf.save("heist_cart_autograb", heist_cart_autograb)
        end

        if ImGui.Button(translateLabel("Unlock All Heist Options")) then
          UI.widgetSound("Select")
          script.run_in_fiber(function()
            stats.set_int("MPX_H3OPT_ACCESSPOINTS", -1)
            stats.set_int("MPX_H3OPT_POI", -1)
            stats.set_int("MPX_H3OPT_BITSET0", -1)
            stats.set_int("MPX_H3OPT_BITSET1", -1)
            stats.set_int("MPX_H3OPT_BODYARMORLVL", 3)
            stats.set_int("MPX_H3OPT_DISRUPTSHIP", 3)
            stats.set_int("MPX_H3OPT_KEYLEVELS", 2)
            stats.set_int("MPX_H3_COMPLETEDPOSIX", 0)
            stats.set_int("MPX_CAS_HEIST_FLOW", -1)
            stats.set_int("MPPLY_H3_COOLDOWN", 0)
            stats.set_packed_stat_bool(26969, true) --Unlock High Roller
          end)
        end

        if ImGui.Button(translateLabel("%0_ai_cuts_Btn")) then
          UI.widgetSound("Select")
          tunables.set_int("CH_LESTER_CUT", 0)
          tunables.set_int("HEIST3_PREPBOARD_GUNMEN_KARL_CUT", 0)
          tunables.set_int("HEIST3_PREPBOARD_GUNMEN_GUSTAVO_CUT", 0)
          tunables.set_int("HEIST3_PREPBOARD_GUNMEN_CHARLIE_CUT", 0)
          tunables.set_int("HEIST3_PREPBOARD_GUNMEN_CHESTER_CUT", 0)
          tunables.set_int("HEIST3_PREPBOARD_GUNMEN_PATRICK_CUT", 0)
          tunables.set_int("HEIST3_DRIVERS_KARIM_CUT", 0)
          tunables.set_int("HEIST3_DRIVERS_TALIANA_CUT", 0)
          tunables.set_int("HEIST3_DRIVERS_EDDIE_CUT", 0)
          tunables.set_int("HEIST3_DRIVERS_ZACH_CUT", 0)
          tunables.set_int("HEIST3_DRIVERS_CHESTER_CUT", 0)
          tunables.set_int("HEIST3_HACKERS_CHRISTIAN_CUT", 0)
          tunables.set_int("HEIST3_HACKERS_YOHAN_CUT", 0)
          tunables.set_int("HEIST3_HACKERS_AVI_CUT", 0)
          tunables.set_int("HEIST3_HACKERS_RICKIE_CUT", 0)
          tunables.set_int("HEIST3_HACKERS_PAIGE_CUT", 0)
          tunables.set_int("HEIST3_FINALE_CLEAN_VEHICLE", 0)
          tunables.set_int("HEIST3_FINALE_DECOY_GUNMAN", 0)
        end

        if ImGui.Button(translateLabel("%100_p_cuts_Btn")) then
          UI.widgetSound("Select")
          for i = 1, 4, 1 do
            globals.set_int(gb_casino_heist_planning + gb_casino_heist_planning_cut_offset + i, 100)
          end
        end
        ImGui.EndTabItem()
      end
      ImGui.EndTabBar()
    else
      ImGui.Dummy(1, 5); ImGui.Text("Outdated.")
    end
  else
    ImGui.Dummy(1, 5); ImGui.Text(translateLabel("Unavailable in Single Player"))
  end
end)

-- Players
players_tab           = online_tab:add_tab(translateLabel("playersTab"))
playerIndex           = 0
local selectedPlayer  = 0
local playerCount     = 0
local targetPlayerPed = 0
local playerHeading   = 0
local playerHealth    = 0
local playerArmour    = 0
local playerVeh       = 0
local player_name     = ""
local playerWallet    = ""
local playerBank      = ""
local playerCoords    = vector3
local godmode         = false
local player_in_veh   = false
local player_active   = false
local targetPlayerIndex
players_tab:add_imgui(function()
  if Game.isOnline() then
    ImGui.Text(translateLabel("Total Players:") .. "  [ " .. playerCount .. " ]")
    ImGui.PushItemWidth(320)
    Game.displayPlayerList()
    ImGui.PopItemWidth()
    ImGui.Spacing()
    if player_active then
      ImGui.Spacing()
      ImGui.Text("Cash:" .. "      " .. playerWallet)
      ImGui.Spacing()
      ImGui.Text("Bank:" .. "      " .. playerBank)
      ImGui.Spacing()
      ImGui.Text("Coords:" .. "      " .. tostring(playerCoords))
      if ImGui.IsItemHovered() and ImGui.IsItemClicked(0) then
        log.debug(player_name .. "'s coords: " .. tostring(playerCoords))
        gui.show_message("Samurai's Scripts", player_name .. "'s coordinates logged to console.")
      end
      ImGui.Spacing()
      ImGui.Text("Heading:" .. "     " .. tostring(playerHeading))
      if ImGui.IsItemHovered() and ImGui.IsItemClicked(0) then
        log.debug(player_name .. "'s heading: " .. tostring(playerHeading))
        gui.show_message("Samurai's Scripts", player_name .. "'s heading logged to console.")
      end
      ImGui.Spacing()
      ImGui.Text("Health:" .. "        " .. tostring(playerHealth))
      if playerArmour ~= nil then
        ImGui.Spacing()
        ImGui.Text("Armour:" .. "      " .. tostring(playerArmour))
      end
      ImGui.Spacing()
      ImGui.Text("God Mode:" .. "  " .. tostring(godmode))
      if player_in_veh then
        ImGui.Spacing()
        ImGui.Text("Vehicle:" .. "  " .. tostring(vehicles.get_vehicle_display_name(ENTITY.GET_ENTITY_MODEL(playerVeh))))
        if ImGui.Button("Delete Vehicle") then
          script.run_in_fiber(function(del)
            local pvCTRL = entities.take_control_of(playerVeh, 350)
            if pvCTRL then
              ENTITY.SET_ENTITY_AS_MISSION_ENTITY(playerVeh, true, true)
              del:sleep(200)
              VEHICLE.DELETE_VEHICLE(playerVeh)
              gui.show_success("Samurai's Scripts", "" .. player_name .. "'s vehicle has been yeeted.")
            else
              gui.show_error("Samurai's Scripts",
                "Failed to delete the vehicle! " .. player_name .. " probably has protections on.")
            end
          end)
        end
      end
    else
      ImGui.Text("Player left the session.")
    end
  else
    ImGui.Dummy(1, 5); ImGui.Text(translateLabel("Unavailable in Single Player"))
  end
end)

--[[
    *world*
]]
world_tab = Samurais_scripts:add_tab(translateLabel("worldTab"))

local default_wanted_lvl = 5

local function playHandsUp()
  script.run_in_fiber(function()
    if Game.requestAnimDict("mp_missheist_countrybank@lift_hands") then
      TASK.TASK_PLAY_ANIM(self.get_ped(), "mp_missheist_countrybank@lift_hands", "lift_hands_in_air_outro", 4.0, -4.0, -1,
        50, 1.0, false, false, false)
    end
  end)
end

local function attachPed(ped)
  local myBone = PED.GET_PED_BONE_INDEX(self.get_ped(), 6286)
  script.run_in_fiber(function(ap)
    if not ped_grabbed and not PED.IS_PED_A_PLAYER(ped) then
      if entities.take_control_of(ped, 300) then
        if is_handsUp then
          TASK.CLEAR_PED_TASKS(self.get_ped())
          is_handsUp = false
        end
        if is_playing_anim then
          if anim_music then
            play_music("stop")
            anim_music = false
          end
          cleanup(ap)
          is_playing_anim = false
        end
        if is_playing_scenario then
          stopScenario(self.get_ped(), ap)
          is_playing_scenario = false
        end
        TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, self.get_ped(), myBone, 0.35, 0.3, -0.04, 100.0, 90.0, -10.0, false, true,
          false, true, 1, true, 1)
        ped_grabbed = true
        attached_ped = ped
      else
        gui.show_error("Samurai's Scripts", translateLabel("failedToCtrlNPC"))
      end
    end
  end)
  return ped_grabbed, attached_ped
end

local function attachVeh(veh)
  local attach_X
  local veh_class = Game.Vehicle.class(veh)
  local myBone = PED.GET_PED_BONE_INDEX(self.get_ped(), 6286)
  script.run_in_fiber(function(av)
    if not vehicle_grabbed and not VEHICLE.IS_THIS_MODEL_A_TRAIN(veh_model) then
      if entities.take_control_of(veh, 300) then
        if is_handsUp then
          TASK.CLEAR_PED_TASKS(self.get_ped())
          is_handsUp = false
        end
        if is_playing_anim then
          if anim_music then
            play_music("stop")
            anim_music = false
          end
          cleanup(av)
          is_playing_anim = false
        end
        if is_playing_scenario then
          stopScenario(self.get_ped(), ap)
          is_playing_scenario = false
        end
        if isCrouched then
          PED.RESET_PED_MOVEMENT_CLIPSET(self.get_ped(), 0.3)
          isCrouched = false
        end
        if veh_class == "Commercial" or veh_class == "Industrial" or veh_class == "Utility" then
          if VEHICLE.IS_BIG_VEHICLE(veh) then
            attach_X  = 2.1
            attach_RY = 0.0
          else
            attach_X  = 1.9
            attach_RY = 0.0
          end
        elseif veh_class == "Cycles" or veh_class == "Motorcycles" then
          attach_X  = 0.4
          attach_RY = 0.0
        elseif veh_class == "Planes" or veh_class == "Helicopters" then
          attach_X  = 1.45
          attach_RY = 90
        else
          attach_X  = 1.17
          attach_RY = 0.0
        end
        ENTITY.ATTACH_ENTITY_TO_ENTITY(veh, self.get_ped(), myBone, attach_X, 0.0, 0.0, 0.0, attach_RY, -16.0, false,
          true,
          false, true, 1, true, 1)
        vehicle_grabbed = true
        grabbed_veh     = veh
      else
        gui.show_error("Samurai's Scripts", translateLabel("failedToCtrlNPC"))
      end
    end
  end)
  return vehicle_grabbed, grabbed_veh
end

local function displayHijackAnims()
  local groupAnimNames = {}
  for _, anim in ipairs(hijackOptions) do
    table.insert(groupAnimNames, anim.name)
  end
  grp_anim_index, used = ImGui.Combo("##groupAnims", grp_anim_index, groupAnimNames, #hijackOptions)
end

world_tab:add_imgui(function()
  if ped_grabbed or vehicle_grabbed then
    ImGui.BeginDisabled()
    pedGrabber, pgUsed = ImGui.Checkbox(translateLabel("pedGrabber"), pedGrabber)
    ImGui.EndDisabled()
  else
    pedGrabber, pgUsed = ImGui.Checkbox(translateLabel("pedGrabber"), pedGrabber)
    UI.helpMarker(false, translateLabel("pedGrabber_tt"))
    if pgUsed then
      UI.widgetSound("Nav2")
      if pedGrabber then
        vehicleGrabber = false
      end
    end
  end

  if pedGrabber then
    ImGui.Text(translateLabel("Throw Force"))
    ImGui.PushItemWidth(220)
    pedthrowF, ptfUsed = ImGui.SliderInt("##throw_force", pedthrowF, 10, 100, "%d", 0)
    ImGui.PopItemWidth()
    if ptfUsed then
      UI.widgetSound("Nav")
    end
  end

  if ped_grabbed or vehicle_grabbed then
    ImGui.BeginDisabled()
    vehicleGrabber, vgUsed = ImGui.Checkbox("Vehicle Grabber", vehicleGrabber)
    ImGui.EndDisabled()
  else
    vehicleGrabber, vgUsed = ImGui.Checkbox("Vehicle Grabber", vehicleGrabber)
    UI.helpMarker(false, "Same as 'Ped Grabber' but with vehicles.")
    if vgUsed then
      UI.widgetSound("Nav2")
      if vehicleGrabber then
        pedGrabber = false
      end
    end
  end

  if vehicleGrabber then
    ImGui.Text("Throw Force")
    ImGui.PushItemWidth(220)
    pedthrowF, ptfUsed = ImGui.SliderInt("##throw_force", pedthrowF, 10, 100, "%d", 0)
    ImGui.PopItemWidth()
    if ptfUsed then
      UI.widgetSound("Nav")
    end
  end

  carpool, carpoolUsed = ImGui.Checkbox(translateLabel("carpool"), carpool)
  UI.helpMarker(false, translateLabel("carpool_tt"))
  if carpoolUsed then
    UI.widgetSound("Nav2")
  end

  if carpool then
    if show_npc_veh_ctrls and thisVeh ~= 0 then
      if ImGui.Button("< " .. translateLabel("prevSeat")) then
        script.run_in_fiber(function()
          if PED.IS_PED_SITTING_IN_VEHICLE(self.get_ped(), thisVeh) then
            local numSeats = VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(thisVeh)
            local mySeat   = Game.getPedVehicleSeat(self.get_ped())
            if mySeat <= 0 then
              mySeat = numSeats
            end
            mySeat = mySeat - 1
            if VEHICLE.IS_VEHICLE_SEAT_FREE(thisVeh, mySeat, true) then
              UI.widgetSound("Nav")
              PED.SET_PED_INTO_VEHICLE(self.get_ped(), thisVeh, mySeat)
            else
              mySeat = mySeat - 1
              return
            end
          end
        end)
      end
      ImGui.SameLine()
      if ImGui.Button(translateLabel("nextSeat") .. " >") then
        script.run_in_fiber(function()
          if PED.IS_PED_SITTING_IN_VEHICLE(self.get_ped(), thisVeh) then
            local numSeats = VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(thisVeh)
            local mySeat   = Game.getPedVehicleSeat(self.get_ped())
            if mySeat > numSeats then
              mySeat = 0
            end
            mySeat = mySeat + 1
            if VEHICLE.IS_VEHICLE_SEAT_FREE(thisVeh, mySeat, true) then
              UI.widgetSound("Nav")
              PED.SET_PED_INTO_VEHICLE(self.get_ped(), thisVeh, mySeat)
            else
              mySeat = mySeat + 1
              return
            end
          end
        end)
      end
    end
  end

  animateNPCs, used = ImGui.Checkbox(translateLabel("animateNPCsCB"), animateNPCs)
  if used then
    UI.widgetSound("Nav")
  end
  UI.helpMarker(false, translateLabel("animateNPCs_tt"))
  if animateNPCs then
    ImGui.PushItemWidth(220)
    displayHijackAnims()
    ImGui.PopItemWidth()
    local hijackData = hijackOptions[grp_anim_index + 1]
    ImGui.SameLine()
    if not hijack_started then
      if ImGui.Button("  " .. translateLabel("generic_play_btn") .. "  ##hjStart") then
        UI.widgetSound("Select")
        script.run_in_fiber(function(hjk)
          local gta_peds = entities.get_all_peds_as_handles()
          while not STREAMING.HAS_ANIM_DICT_LOADED(hijackData.dict) do
            STREAMING.REQUEST_ANIM_DICT(hijackData.dict)
            coroutine.yield()
          end
          for _, npc in pairs(gta_peds) do
            if not PED.IS_PED_A_PLAYER(npc) and not PED.IS_PED_IN_ANY_VEHICLE(npc, true) then
              TASK.CLEAR_PED_TASKS_IMMEDIATELY(npc)
              TASK.CLEAR_PED_SECONDARY_TASK(npc)
              hjk:sleep(50)
              TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(npc, true)
              PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(npc, true)
              TASK.TASK_PLAY_ANIM(npc, hijackData.dict, hijackData.anim, 4.0, -4.0, -1, 1, 1.0, false, false, false)
              hijack_started = true
            end
          end
        end)
      end
    else
      if ImGui.Button("  " .. translateLabel("generic_stop_btn") .. "  ##hjStop") then
        UI.widgetSound("Cancel")
        script.run_in_fiber(function()
          local gta_peds = entities.get_all_peds_as_handles()
          for _, npc in ipairs(gta_peds) do
            if not PED.IS_PED_A_PLAYER(npc) then
              TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(npc, false)
              PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(npc, false)
              TASK.CLEAR_PED_TASKS(npc)
              hijack_started = false
            end
          end
        end)
      end
    end
  end

  kamikazeDrivers, kdUsed = ImGui.Checkbox(translateLabel("kamikazeCB"), kamikazeDrivers)
  UI.helpMarker(false, translateLabel("kamikazeDrivers_tt"))
  if kdUsed then
    UI.widgetSound("Nav2")
    if kamikazeDrivers then
      publicEnemy = false
    end
  end

  publicEnemy, peUsed = ImGui.Checkbox(translateLabel("publicEnemyCB"), publicEnemy)
  UI.helpMarker(false, translateLabel("publicEnemy_tt"))
  if peUsed then
    UI.widgetSound("Nav2")
    if publicEnemy then
      kamikazeDrivers = false
      runaway         = false
      script.run_in_fiber(function()
        default_wanted_lvl = PLAYER.GET_MAX_WANTED_LEVEL()
      end)
    else
      script.run_in_fiber(function()
        local myGroup = PED.GET_PED_GROUP_INDEX(self.get_ped())
        if default_wanted_lvl ~= nil then
          PLAYER.SET_MAX_WANTED_LEVEL(default_wanted_lvl)
          PLAYER.SET_POLICE_IGNORE_PLAYER(self.get_id(), false)
        end
        for _, ped in ipairs(entities.get_all_peds_as_handles()) do
          if not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_GROUP_MEMBER(ped, myGroup) then
            if PED.IS_PED_IN_COMBAT(ped, self.get_ped()) then
              for _, attr in ipairs(pe_combat_attributes_T) do
                PED.SET_PED_COMBAT_ATTRIBUTES(ped, attr.id, (not attr.bool))
              end
              for _, cflg in ipairs(pe_config_flags_T) do
                if PED.GET_PED_CONFIG_FLAG(ped, cflg.id, cflg.bool) then
                  PED.SET_PED_CONFIG_FLAG(ped, cflg.id, (not cflg.bool))
                end
              end
              TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
              TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, false)
              PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, false)
            end
          end
        end
      end)
    end
  end

  public_seats, pseatsUsed = ImGui.Checkbox("Public Seating", public_seats)
  UI.helpMarker(false, "Allows you to sit down on public benches and seats")
  if pseatsUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("public_seats", public_seats)
  end

  extend_world, ewbUsed = ImGui.Checkbox(translateLabel("extendWorldCB"), extend_world)
  UI.helpMarker(false, translateLabel("extendWorld_tt"))
  if ewbUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("extend_world", extend_world)
    if not extend_world then
      script.run_in_fiber(function()
        Game.World.extendBounds(false)
        world_extended = false
      end)
    end
  end

  disable_waves, dowUsed = ImGui.Checkbox(translateLabel("smoothwatersCB"), disable_waves)
  UI.helpMarker(false, translateLabel("smoothwaters_tt"))
  if dowUsed then
    UI.widgetSound("Nav2")
    if disable_waves then
      Game.World.disableOceanWaves(true)
    else
      Game.World.disableOceanWaves(false)
    end
  end
end)

object_spawner        = world_tab:add_tab("Object Spawner")
local coords          = self.get_pos()
local heading         = 0.0
local forwardX        = 0.0
local forwardY        = 0.0
objects_search        = ""
propName              = ""
invalidType           = ""
saved_props_name      = ""
edit_mode             = false
activeX               = false
activeY               = false
activeZ               = false
rotX                  = false
rotY                  = false
rotZ                  = false
attached              = false
attachToSelf          = false
attachToVeh           = false
previewStarted        = false
isChanged             = false
showInvalidObjText    = false
blacklisted_obj       = false
spawned_persist_props = false
prop                  = 0
propHash              = 0
os_switch             = 0
prop_index            = 0
objects_index         = 0
spawned_index         = 0
selectedObject        = 0
axisMult              = 1
selected_bone         = 0
previewEntity         = 0
currentObjectPreview  = 0
attached_index        = 0
vattached_index       = 0
zOffset               = 0
persist_prop_index    = 0
spawned_props         = {}
vehAttachments        = {}
vehicle_attachments   = {}
spawned_persist_T     = {}
attached_props        = {}
selfAttachNames       = {}
spawnDistance         = { x = 0, y = 0, z = 0 }
spawnRot              = { x = 0, y = 0, z = 0 }
prop_creation         = { name = "", props = {} }
selfAttachments       = { entity = 0, hash = 0, bone = 0, posx = 0.0, posy = 0.0, posz = 0.0, rotx = 0.0, roty = 0.0, rotz = 0.0 }
persist_attachments   = lua_cfg.read("persist_attachments")

local function resetSliders()
  spawnDistance = { x = 0, y = 0, z = 0 }
  spawnRot      = { x = 0, y = 0, z = 0 }
end

local function updateFilteredProps()
  filteredProps = {}
  for _, p in ipairs(custom_props) do
    if string.find(string.lower(p.name), string.lower(objects_search)) then
      table.insert(filteredProps, p)
    end
    table.sort(custom_props, function(a, b)
      return a.name < b.name
    end)
  end
end

local function displayFilteredProps()
  updateFilteredProps()
  local propNames = {}
  for _, p in ipairs(filteredProps) do
    table.insert(propNames, p.name)
  end
  prop_index, used = ImGui.ListBox("##propList", prop_index, propNames, #filteredProps)
  prop = filteredProps[prop_index + 1]
  if prop ~= nil then
    propHash = prop.hash
    propName = prop.name
  end
end

local function getAllObjects()
  filteredObjects = {}
  for _, object in ipairs(gta_objets) do
    if objects_search ~= "" then
      if string.find(string.lower(object), string.lower(objects_search)) then
        table.insert(filteredObjects, object)
      end
    else
      table.insert(filteredObjects, object)
    end
  end
  objects_index, used = ImGui.ListBox("##gtaObjectsList", objects_index, filteredObjects, #filteredObjects)
  prop                = filteredObjects[objects_index + 1]
  propHash            = joaat(prop)
  propName            = prop
  if gui.is_open() and os_switch ~= 0 then
    for _, b in ipairs(mp_blacklist) do
      if propName == b then
        showInvalidObjText = true
        blacklisted_obj    = true
        invalidType        = translateLabel("R*_blacklist")
        break
      else
        showInvalidObjText = false
        blacklisted_obj    = false
      end
      for _, c in ipairs(crash_objects) do
        if propName == c then
          showInvalidObjText = true
          invalidType = translateLabel("crash_object")
          break
        else
          showInvalidObjText = false
        end
      end
    end
  end
end

local function updateSelfBones()
  filteredSelfBones = {}
  for _, bone in ipairs(pedBones) do
    table.insert(filteredSelfBones, bone)
  end
end

local function displaySelfBones()
  updateSelfBones()
  local boneNames = {}
  for _, bone in ipairs(filteredSelfBones) do
    table.insert(boneNames, bone.name)
  end
  selected_bone, used = ImGui.Combo("##pedBones", selected_bone, boneNames, #filteredSelfBones)
end

local function updateVehBones()
  filteredVehBones = {}
  for _, bone in ipairs(vehBones) do
    local bone_idx = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, bone)
    if bone_idx ~= nil and bone_idx ~= -1 then
      table.insert(filteredVehBones, bone)
    end
  end
end

local function displayVehBones()
  updateVehBones()
  local boneNames = {}
  for _, bone in ipairs(filteredVehBones) do
    table.insert(boneNames, bone)
  end
  selected_bone, used = ImGui.Combo("##vehBones", selected_bone, boneNames, #filteredVehBones)
end

local function stopPreview()
  if previewStarted then
    previewStarted = false
  end
  pedPreviewModel     = 0
  vehiclePreviewModel = 0
  objectPreviewModel  = 0
  previewEntity       = 0
end

local function displaySpawnedObjects()
  spawnedNames = {}
  if spawned_props[1] ~= nil then
    for _, v in ipairs(spawned_props) do
      table.insert(spawnedNames, v.name)
    end
  end
  spawned_index, spiUsed = ImGui.Combo("##spawnedProps", spawned_index, spawnedNames, #spawned_props)
end

local function displayAttachedObjects()
  selfAttachNames = {}
  if attached_props[1] ~= nil then
    for _, v in ipairs(attached_props) do
      table.insert(selfAttachNames, v.name)
    end
  end
  attached_index, used = ImGui.Combo("##Attached Objects", attached_index, selfAttachNames, #attached_props)
end

local function displayVehAttachments()
  vehAttachNames = {}
  if vehicle_attachments[1] ~= nil then
    for _, v in ipairs(vehicle_attachments) do
      table.insert(vehAttachNames, v.name)
    end
  end
  vattached_index, used = ImGui.Combo("##vehAttachedObjects", vattached_index, vehAttachNames, #vehicle_attachments)
end

local function filterPersistProps()
  filteredPersistProps = {}
  if persist_attachments[1] ~= nil then
    for _, t in ipairs(persist_attachments) do
      table.insert(filteredPersistProps, t)
    end
  end
end

local function showPersistProps()
  filterPersistProps()
  persist_prop_names = {}
  for _, p in ipairs(filteredPersistProps) do
    table.insert(persist_prop_names, p.name)
  end
  persist_prop_index, _ = ImGui.ListBox("##persist_props", persist_prop_index, persist_prop_names, #filteredPersistProps)
end

object_spawner:add_imgui(function()
  ImGui.BeginTabBar("Object Spawner")
  if ImGui.BeginTabItem("Spawn & Create") then
    ImGui.Spacing(); os_switch, os_switchUsed = ImGui.RadioButton(translateLabel("Custom Objects"), os_switch, 0)
    if os_switchUsed then
      UI.widgetSound("Nav")
    end
    ImGui.SameLine(); ImGui.Dummy(40, 1); ImGui.SameLine(); os_switch, os_switchUsed = ImGui.RadioButton(
      translateLabel("All Objects"), os_switch, 1)
    ImGui.PushItemWidth(360)
    objects_search, used = ImGui.InputTextWithHint("##searchObjects", translateLabel("search_hint"), objects_search, 32)
    if ImGui.IsItemActive() then
      is_typing = true
    else
      is_typing = false
    end
    if os_switchUsed then
      UI.widgetSound("Nav")
    end
    if os_switch == 0 then
      displayFilteredProps()
      ImGui.PopItemWidth()
    else
      getAllObjects()
    end
    ImGui.PopItemWidth()
    ImGui.Spacing()
    ImGui.BeginDisabled(blacklisted_obj)
    preview, _ = ImGui.Checkbox(translateLabel("Preview"), preview)
    ImGui.EndDisabled()
    if previewUsed then
      UI.widgetSound("Nav2")
    end
    if preview then
      spawnCoords            = ENTITY.GET_ENTITY_COORDS(previewEntity, false)
      previewLoop            = true
      currentObjectPreview   = propHash
      local previewObjectPos = ENTITY.GET_ENTITY_COORDS(previewEntity, false)
      ImGui.Text(translateLabel("Move_FB")); ImGui.SameLine(); ImGui.Spacing(); ImGui.SameLine(); ImGui.Text(
        translateLabel("Move_UD"))
      ImGui.Dummy(10, 1); ImGui.SameLine()
      ImGui.ArrowButton("##f2", 2)
      if ImGui.IsItemActive() then
        forwardX = forwardX * 0.1
        forwardY = forwardY * 0.1
        ENTITY.SET_ENTITY_COORDS(previewEntity, previewObjectPos.x + forwardX, previewObjectPos.y + forwardY,
          previewObjectPos.z, false, false, false, false)
      end
      ImGui.SameLine()
      ImGui.ArrowButton("##f3", 3)
      if ImGui.IsItemActive() then
        forwardX = forwardX * 0.1
        forwardY = forwardY * 0.1
        ENTITY.SET_ENTITY_COORDS(previewEntity, previewObjectPos.x - forwardX, previewObjectPos.y - forwardY,
          previewObjectPos.z, false, false, false, false)
      end
      ImGui.SameLine()
      ImGui.Dummy(60, 1); ImGui.SameLine()
      ImGui.ArrowButton("##z2", 2)
      if ImGui.IsItemActive() then
        zOffset = zOffset + 0.01
        ENTITY.SET_ENTITY_COORDS(previewEntity, previewObjectPos.x, previewObjectPos.y, previewObjectPos.z + 0.01, false,
          false, false, false)
      end
      ImGui.SameLine()
      ImGui.ArrowButton("##z3", 3)
      if ImGui.IsItemActive() then
        zOffset = zOffset - 0.01
        ENTITY.SET_ENTITY_COORDS(previewEntity, previewObjectPos.x, previewObjectPos.y, previewObjectPos.z - 0.01, false,
          false, false, false)
      end
    else
      previewStarted = false
      previewLoop    = false
      zOffset        = 0.0
      forwardX       = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
      forwardY       = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
    end
    if NETWORK.NETWORK_IS_SESSION_ACTIVE() then
      if not preview then
        ImGui.SameLine()
      end
      ImGui.BeginDisabled(blacklisted_obj)
      spawnForPlayer, _ = ImGui.Checkbox(translateLabel("Spawn For a Player"), spawnForPlayer)
      if spawnForPlayerUsed then
        UI.widgetSound("Nav2")
      end
      ImGui.EndDisabled()
    end
    if spawnForPlayer then
      ImGui.PushItemWidth(270)
      Game.displayPlayerList()
      ImGui.PopItemWidth()
      selectedPlayer = filteredPlayers[playerIndex + 1]
      coords         = ENTITY.GET_ENTITY_COORDS(selectedPlayer, false)
      heading        = ENTITY.GET_ENTITY_HEADING(selectedPlayer)
      forwardX       = ENTITY.GET_ENTITY_FORWARD_X(selectedPlayer)
      forwardY       = ENTITY.GET_ENTITY_FORWARD_Y(selectedPlayer)
      ImGui.SameLine()
    else
      coords   = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
      heading  = ENTITY.GET_ENTITY_HEADING(self.get_ped())
      forwardX = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
      forwardY = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
    end
    ImGui.SameLine(); ImGui.BeginDisabled(blacklisted_obj)
    if ImGui.Button(translateLabel("Spawn") .. "##obj") then
      UI.widgetSound("Select")
      script.run_in_fiber(function()
        while not STREAMING.HAS_MODEL_LOADED(propHash) do
          STREAMING.REQUEST_MODEL(propHash)
          coroutine.yield()
        end
        if preview then
          spawnedObject = OBJECT.CREATE_OBJECT(propHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, true, true, false)
        else
          spawnedObject = OBJECT.CREATE_OBJECT(propHash, coords.x + (forwardX * 3), coords.y + (forwardY * 3), coords.z,
            true, true, false)
        end
        if ENTITY.DOES_ENTITY_EXIST(spawnedObject) then
          ENTITY.SET_ENTITY_HEADING(spawnedObject, heading)
          OBJECT.PLACE_OBJECT_ON_GROUND_PROPERLY(spawnedObject)
          local thisProp  = {}
          thisProp.name   = propName
          thisProp.hash   = propHash
          thisProp.entity = spawnedObject
          table.insert(spawned_props, thisProp)
        end
      end)
    end
    ImGui.EndDisabled()
    if showInvalidObjText then
      UI.coloredText(translateLabel("invalid_obj") .. invalidType, "#EED202", 1, 15)
    end
    if spawned_props[1] ~= nil then
      ImGui.Text(translateLabel("spawned_objects"))
      ImGui.PushItemWidth(270)
      displaySpawnedObjects()
      ImGui.PopItemWidth()
      selectedObject = spawned_props[spawned_index + 1]
      if #spawned_props > 1 then
        Game.World.markSelectedEntity(selectedObject.entity)
      end
      ImGui.SameLine()
      if ImGui.Button(translateLabel("generic_delete") .. "##objects") then
        UI.widgetSound("Delete")
        script.run_in_fiber(function(script)
          if ENTITY.DOES_ENTITY_EXIST(selectedObject.entity) then
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(selectedObject.entity, true, true)
            script:sleep(100)
            ENTITY.DELETE_ENTITY(selectedObject.entity)
            spawned_index = 0
            if spawned_index > 1 then
              spawned_index = spawned_index - 1
            end
          end
        end)
      end
      ImGui.Separator()
      attachToSelf, attachToSelfUsed = ImGui.Checkbox(translateLabel("Attach To Self"), attachToSelf)
      if attachToSelfUsed then
        UI.widgetSound("Nav2")
      end
      if current_vehicle ~= nil and current_vehicle ~= 0 then
        ImGui.SameLine(); attachToVeh, attachToVehUsed = ImGui.Checkbox(translateLabel("Attach To Vehicle"), attachToVeh)
        if attachToVehUsed then
          attachToSelf = false
          UI.widgetSound("Nav2")
        end
      else
        ImGui.BeginDisabled()
        ImGui.SameLine(); attachToVeh, _ = ImGui.Checkbox(translateLabel("Attach To Vehicle"), attachToVeh)
        ImGui.EndDisabled()
        UI.toolTip(false, translateLabel("getinveh"))
      end
      if attachToSelf then
        attachToVeh = false
        ImGui.PushItemWidth(230)
        displaySelfBones()
        ImGui.PopItemWidth()
        boneData = filteredSelfBones[selected_bone + 1]
        ImGui.SameLine()
        if ImGui.Button(" " .. translateLabel("attachBtn") .. " " .. "##self") then
          script.run_in_fiber(function()
            if not ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(selectedObject.entity, self.get_ped()) then
              UI.widgetSound("Select2")
              ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject.entity, self.get_ped(),
                PED.GET_PED_BONE_INDEX(self.get_ped(), boneData.ID), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false,
                false,
                2, true, 1)
              attached = true
              if selfAttachments[1] ~= nil then
                for _, v in ipairs(selfAttachments) do
                  if selectedObject.entity ~= v.entity then
                    selfAttachments.entity = selectedObject.entity
                    selfAttachments.hash   = Game.getEntityModel(selectedObject.entity)
                    selfAttachments.name   = selectedObject.name
                    selfAttachments.bone   = boneData.ID
                    selfAttachments.posx   = 0.0
                    selfAttachments.posy   = 0.0
                    selfAttachments.posz   = 0.0
                    selfAttachments.rotx   = 0.0
                    selfAttachments.roty   = 0.0
                    selfAttachments.rotz   = 0.0
                  end
                end
              else
                selfAttachments.entity = selectedObject.entity
                selfAttachments.hash   = Game.getEntityModel(selectedObject.entity)
                selfAttachments.name   = selectedObject.name
                selfAttachments.bone   = boneData.ID
                selfAttachments.posx   = 0.0
                selfAttachments.posy   = 0.0
                selfAttachments.posz   = 0.0
                selfAttachments.rotx   = 0.0
                selfAttachments.roty   = 0.0
                selfAttachments.rotz   = 0.0
              end
              table.insert(attached_props, selfAttachments)
              selfAttachments = {}
              attached        = true
              attachedToSelf  = true
            else
              UI.widgetSound("Error")
              gui.show_error("Samurai's Scripts", "This object is already attached!")
            end
          end)
        end
        if attached_props[1] ~= nil then
          ImGui.Text(translateLabel("attached_objects"))
          ImGui.PushItemWidth(230)
          displayAttachedObjects()
          ImGui.PopItemWidth()
          selectedAttachment = attached_props[attached_index + 1]
          ImGui.SameLine()
          if ImGui.Button(translateLabel("detachBtn") .. "##self") then
            UI.widgetSound("Cancel")
            script.run_in_fiber(function()
              ENTITY.DETACH_ENTITY(selectedAttachment.entity, true, true)
              for k, v in ipairs(attached_props) do
                if selectedAttachment.entity == v.entity then
                  table.remove(attached_props, k)
                end
              end
            end)
          end
        end
      end
      if attachToVeh then
        attachToSelf = false
        ImGui.PushItemWidth(230)
        displayVehBones()
        ImGui.PopItemWidth()
        boneData = filteredVehBones[selected_bone + 1]
        ImGui.SameLine()
        if ImGui.Button(" " .. translateLabel("attachBtn") .. " " .. "##veh") then
          UI.widgetSound("Select2")
          script.run_in_fiber(function()
            ENTITY.ATTACH_ENTITY_TO_ENTITY(selectedObject.entity, current_vehicle,
              ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, boneData), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false,
              false,
              false,
              2, true, 1)
            attached       = ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(selectedObject.entity, self.get_veh())
            attachedObject = selectedObject
            if vehAttachments[1] ~= nil then
              for _, v in ipairs(vehAttachments) do
                if selectedObject.entity ~= v.entity then
                  vehAttachments.entity = selectedObject.entity
                  vehAttachments.hash   = Game.getEntityModel(selectedObject.entity)
                  vehAttachments.name   = selectedObject.name
                  vehAttachments.bone   = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, boneData)
                  vehAttachments.posx   = 0.0
                  vehAttachments.posy   = 0.0
                  vehAttachments.posz   = 0.0
                  vehAttachments.rotx   = 0.0
                  vehAttachments.roty   = 0.0
                  vehAttachments.rotz   = 0.0
                end
              end
            else
              vehAttachments.entity = selectedObject.entity
              vehAttachments.hash   = Game.getEntityModel(selectedObject.entity)
              vehAttachments.name   = selectedObject.name
              vehAttachments.bone   = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, boneData)
              vehAttachments.posx   = 0.0
              vehAttachments.posy   = 0.0
              vehAttachments.posz   = 0.0
              vehAttachments.rotx   = 0.0
              vehAttachments.roty   = 0.0
              vehAttachments.rotz   = 0.0
            end
            table.insert(vehicle_attachments, vehAttachments)
            vehAttachments = {}
            attached       = true
            attachedToSelf = true
          end)
        end
        if vehicle_attachments[1] ~= nil then
          ImGui.Text(translateLabel("attached_objects"))
          ImGui.PushItemWidth(230)
          displayVehAttachments()
          ImGui.PopItemWidth()
          selectedAttachment = vehicle_attachments[attached_index + 1]
          ImGui.SameLine()
          if ImGui.Button(translateLabel("detachBtn") .. "##veh") then
            UI.widgetSound("Cancel")
            script.run_in_fiber(function()
              ENTITY.DETACH_ENTITY(selectedAttachment.entity, true, true)
              for k, v in ipairs(vehicle_attachments) do
                if selectedAttachment.entity == v.entity then
                  table.remove(vehicle_attachments, k)
                end
              end
            end)
          end
        end
      end
      edit_mode, edit_modeUsed = ImGui.Checkbox(translateLabel("editMode"), edit_mode)
      if edit_modeUsed then
        UI.widgetSound("Nav2")
      end
      UI.helpMarker(false, translateLabel("editMode_tt"))
      ImGui.SameLine(); ImGui.Dummy(10, 1); ImGui.SameLine()
      if ImGui.Button("   " .. translateLabel("generic_reset") .. "   ") then
        UI.widgetSound("Select")
        script.run_in_fiber(function()
          if ENTITY.IS_ENTITY_ATTACHED(selected_att) then
            selectedAttachment.posx, selectedAttachment.posy, selectedAttachment.posz,
            selectedAttachment.rotx, selectedAttachment.roty, selectedAttachment.rotz = 0.0,
                0.0, 0.0, 0.0, 0.0, 0.0
            ENTITY.ATTACH_ENTITY_TO_ENTITY(selected_att, target, attachBone, 0.0, 0.0, 0.0,
              0.0, 0.0, 0.0, false, false, false, false, 2, true, 1)
          else
            resetSliders()
            ENTITY.SET_ENTITY_COORDS(selectedObject.entity, coords.x + (forwardX * 3), coords.y + (forwardY * 3),
              coords.z, false,
              false, false, false)
            ENTITY.SET_ENTITY_HEADING(selectedObject.entity, heading)
            OBJECT.PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(selectedObject.entity)
          end
        end)
      end
      UI.helpMarker(false, translateLabel("resetSlider_tt"))
      if edit_mode and not ENTITY.IS_ENTITY_ATTACHED(selectedObject.entity) then
        ImGui.Text(translateLabel("xyz_multiplier"))
        ImGui.PushItemWidth(280)
        axisMult, _ = ImGui.InputInt("##multiplier", axisMult, 1, 2)
        ImGui.Text("                        X Axis :")
        spawnDistance.x, _ = ImGui.SliderFloat(" ", spawnDistance.x, -0.1 * axisMult, 0.1 * axisMult)
        activeX = ImGui.IsItemActive()
        ImGui.Separator()
        ImGui.Text("                        Y Axis :")
        spawnDistance.y, _ = ImGui.SliderFloat("  ", spawnDistance.y, -0.1 * axisMult, 0.1 * axisMult)
        activeY = ImGui.IsItemActive()
        ImGui.Separator()
        ImGui.Text("                        Z Axis :")
        spawnDistance.z, _ = ImGui.SliderFloat("   ", spawnDistance.z, -0.05 * axisMult, 0.05 * axisMult)
        activeZ = ImGui.IsItemActive()
        ImGui.Separator(); ImGui.Text(translateLabel("Rotate Object:"))
        ImGui.Text("                        X Axis :")
        spawnRot.x, _ = ImGui.SliderFloat("##xRot", spawnRot.x, -0.1 * axisMult, 0.1 * axisMult)
        rotX = ImGui.IsItemActive()
        ImGui.Separator()
        ImGui.Text("                        Y Axis :")
        spawnRot.y, _ = ImGui.SliderFloat("##yRot", spawnRot.y, -0.1 * axisMult, 0.1 * axisMult)
        rotY = ImGui.IsItemActive()
        ImGui.Separator()
        ImGui.Text("                        Z Axis :")
        spawnRot.z, _ = ImGui.SliderFloat("##zRot", spawnRot.z, -0.5 * axisMult, 0.5 * axisMult)
        rotZ = ImGui.IsItemActive()
        ImGui.PopItemWidth()
      else
        if edit_mode and attached_props[1] ~= nil or edit_mode and vehicle_attachments[1] ~= nil then
          if ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(selectedObject.entity, self.get_ped()) then
            target       = self.get_ped()
            attachBone   = PED.GET_PED_BONE_INDEX(self.get_ped(), selectedAttachment.bone)
            selected_att = selectedAttachment.entity
          elseif ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(selectedObject.entity, self.get_veh()) then
            target       = current_vehicle
            attachBone   = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, boneData)
            selected_att = selectedAttachment.entity
          end
          ImGui.Text(translateLabel("xyz_multiplier"))
          ImGui.PushItemWidth(271)
          axisMult, _ = ImGui.InputInt("##AttachMultiplier", axisMult, 1, 2)
          ImGui.PopItemWidth()
          ImGui.Spacing()
          ImGui.Text("X Axis :"); ImGui.SameLine(); ImGui.Dummy(25, 1); ImGui.SameLine(); ImGui.Text("Y Axis :"); ImGui
              .SameLine()
          ImGui.Dummy(25, 1); ImGui.SameLine(); ImGui.Text("Z Axis :")
          ImGui.ArrowButton("##Xleft", 0)
          if ImGui.IsItemActive() then
            selectedAttachment.posx = selectedAttachment.posx + 0.001 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
          ImGui.SameLine()
          ImGui.ArrowButton("##XRight", 1)
          if ImGui.IsItemActive() then
            selectedAttachment.posx = selectedAttachment.posx - 0.001 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
          ImGui.SameLine()
          ImGui.Dummy(5, 1); ImGui.SameLine()
          ImGui.ArrowButton("##Yleft", 0)
          if ImGui.IsItemActive() then
            selectedAttachment.posy = selectedAttachment.posy + 0.001 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
          ImGui.SameLine()
          ImGui.ArrowButton("##YRight", 1)
          if ImGui.IsItemActive() then
            selectedAttachment.posy = selectedAttachment.posy - 0.001 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
          ImGui.SameLine()
          ImGui.Dummy(5, 1); ImGui.SameLine()
          ImGui.ArrowButton("##zUp", 2)
          if ImGui.IsItemActive() then
            selectedAttachment.posz = selectedAttachment.posz + 0.001 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
          ImGui.SameLine()
          ImGui.ArrowButton("##zDown", 3)
          if ImGui.IsItemActive() then
            selectedAttachment.posz = selectedAttachment.posz - 0.001 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
          ImGui.Text("X Rotation :"); ImGui.SameLine(); ImGui.Text("Y Rotation :"); ImGui.SameLine(); ImGui.Text(
            "Z Rotation :")
          ImGui.ArrowButton("##rotXleft", 0)
          if ImGui.IsItemActive() then
            selectedAttachment.rotx = selectedAttachment.rotx + 0.5 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
          ImGui.SameLine()
          ImGui.ArrowButton("##rotXright", 1)
          if ImGui.IsItemActive() then
            selectedAttachment.rotx = selectedAttachment.rotx - 0.5 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
          ImGui.SameLine()
          ImGui.Dummy(5, 1); ImGui.SameLine()
          ImGui.ArrowButton("##rotYleft", 0)
          if ImGui.IsItemActive() then
            selectedAttachment.roty = selectedAttachment.roty + 0.5 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
          ImGui.SameLine()
          ImGui.ArrowButton("##rotYright", 1)
          if ImGui.IsItemActive() then
            selectedAttachment.roty = selectedAttachment.roty - 0.5 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
          ImGui.SameLine()
          ImGui.Dummy(5, 1); ImGui.SameLine()
          ImGui.ArrowButton("##rotZup", 2)
          if ImGui.IsItemActive() then
            selectedAttachment.rotz = selectedAttachment.rotz + 0.5 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
          ImGui.SameLine()
          ImGui.ArrowButton("##rotZdown", 3)
          if ImGui.IsItemActive() then
            selectedAttachment.rotz = selectedAttachment.rotz - 0.5 * axisMult
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
              selected_att, target, attachBone, selectedAttachment.posx,
              selectedAttachment.posy, selectedAttachment.posz, selectedAttachment.rotx,
              selectedAttachment.roty, selectedAttachment.rotz, false, false, false, false, 2, true, 1
            )
          end
        end
      end
      ImGui.Dummy(1, 5)
      if attachedToSelf and attached_props[1] ~= nil then
        if ImGui.Button("  " .. translateLabel("saveBtn") .. "  ##obj") then
          UI.widgetSound("Select")
          ImGui.OpenPopup("persist props")
        end
        ImGui.SetNextWindowPos(760, 400, ImGuiCond.Appearing)
        ImGui.SetNextWindowBgAlpha(0.8)
        if ImGui.BeginPopupModal("persist props", ImGuiWindowFlags.AlwaysAutoResize | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.NoTitleBar) then
          ImGui.Dummy(1, 5); ImGui.Text("Give your creation a name and save it."); ImGui.Dummy(1, 5)
          saved_props_name, _ = ImGui.InputTextWithHint("##persistpropname", "Name", saved_props_name, 64)
          if ImGui.IsItemActive() then
            is_typing = true
          else
            is_typing = false
          end
          ImGui.Dummy(1, 5)
          if ImGui.Button(translateLabel("saveBtn") .. "##obj2") then
            local timer = 0
            if saved_props_name ~= "" then
              if persist_attachments[1] ~= nil then
                for _, v in pairs(persist_attachments) do
                  if saved_props_name == v.name then
                    UI.widgetSound("Error")
                    gui.show_error("Samurai's Scripts", "You already have an outfit with the same name.")
                    return
                  end
                end
              end
              UI.widgetSound("Select")
              prop_creation.name  = saved_props_name
              prop_creation.props = attached_props
              table.insert(persist_attachments, prop_creation)
              lua_cfg.save("persist_attachments", persist_attachments)
              gui.show_success("Samurai's Scripts", string.format("Your [ %s ] has been saved", saved_props_name))
              repeat
                timer = timer + 1
              until timer >= 50
              prop_creation       = { name = "", props = {} }
              persist_prop_index  = 0
              saved_props_name    = ""
              persist_attachments = lua_cfg.read("persist_attachments")
              if spawned_props[1] ~= nil then
                script.run_in_fiber(function()
                  for _, p in ipairs(spawned_props) do
                    if ENTITY.DOES_ENTITY_EXIST(p.entity) then
                      ENTITY.SET_ENTITY_AS_MISSION_ENTITY(p.entity, true, true)
                      ENTITY.DELETE_ENTITY(p.entity)
                    end
                  end
                end)
              end
            else
              UI.widgetSound("Error")
              gui.show_error("Samurai's Scripts", "Please enter a name")
            end
            ImGui.CloseCurrentPopup()
          end
          ImGui.SameLine(); ImGui.Dummy(50, 1); ImGui.SameLine()
          if ImGui.Button(translateLabel("generic_cancel_btn")) then
            UI.widgetSound("Cancel")
            saved_props_name = ""
            ImGui.CloseCurrentPopup()
          end
          ImGui.EndPopup()
        end
      end
    end
    ImGui.EndTabItem()
  end
  if ImGui.BeginTabItem("Saved Creations") then
    if persist_attachments[1] ~= nil then
      ImGui.PushItemWidth(360)
      showPersistProps()
      ImGui.PopItemWidth()
      local persist_prop_info = filteredPersistProps[persist_prop_index + 1]
      ImGui.Dummy(1, 5)
      if spawned_persist_T[1] == nil then
        if ImGui.Button(translateLabel("Spawn"), 80, 32) then
          UI.widgetSound("Select")
          script.run_in_fiber(function(pers)
            for _, p in ipairs(persist_prop_info.props) do
              if Game.requestModel(p.hash) then
                local persist_prop = OBJECT.CREATE_OBJECT(p.hash, 0.0, 0.0, 0.0, true, true, false)
                pers:sleep(200)
                if ENTITY.DOES_ENTITY_EXIST(persist_prop) then
                  table.insert(spawned_persist_T, persist_prop)
                  ENTITY.ATTACH_ENTITY_TO_ENTITY(persist_prop, self.get_ped(),
                    PED.GET_PED_BONE_INDEX(self.get_ped(), p.bone), p.posx, p.posy, p.posz, p.rotx, p.roty, p.rotz,
                    false, false, false, false, 2, true, 1)
                end
              end
            end
          end)
        end
      else
        if ImGui.Button(translateLabel("generic_delete") .. "##persist_props", 80, 32) then
          UI.widgetSound("Delete")
          script.run_in_fiber(function(del)
            for _, p in ipairs(spawned_persist_T) do
              if ENTITY.DOES_ENTITY_EXIST(p) then
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(p, true, true)
                del:sleep(100)
                ENTITY.DELETE_ENTITY(p)
              end
            end
          end)
        end
      end
      ImGui.SameLine(); ImGui.Dummy(60, 1); ImGui.SameLine()
      if UI.coloredButton(translateLabel("vc_delete_persist") .. "##props", "#E40000", "#FF3F3F", "#FF8080", 0.87) then
        UI.widgetSound("Focus_In")
        ImGui.OpenPopup("Remove Persistent Props")
      end
      ImGui.SetNextWindowPos(760, 400, ImGuiCond.Appearing)
      ImGui.SetNextWindowSizeConstraints(200, 100, 400, 400)
      ImGui.SetNextWindowBgAlpha(0.7)
      if ImGui.BeginPopupModal("Remove Persistent Props", ImGuiWindowFlags.AlwaysAutoResize | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.NoTitleBar) then
        UI.coloredText(translateLabel("confirm_txt"), "yellow", 0.91, 35)
        ImGui.Dummy(1, 20)
        if ImGui.Button("   " .. translateLabel("yes") .. "   ##selfprops") then
          for key, value in ipairs(persist_attachments) do
            if persist_prop_info == value then
              table.remove(persist_attachments, key)
              lua_cfg.save("persist_attachments", persist_attachments)
            end
          end
          UI.widgetSound("Select")
          ImGui.CloseCurrentPopup()
        end
        ImGui.SameLine(); ImGui.Dummy(20, 1); ImGui.SameLine()
        if ImGui.Button("   " .. translateLabel("no") .. "   ##selfprops") then
          UI.widgetSound("Cancel")
          ImGui.CloseCurrentPopup()
        end
        ImGui.End()
      end
    else
      ImGui.Dummy(1, 10); UI.wrappedText(
        "Attach some objects to yourself then save them to be able to spawn them from this tab.", 20)
    end
    ImGui.EndTabItem()
  end
  ImGui.EndTabBar()
end)

--[[
    *settings*
]]
local settings_tab = Samurais_scripts:add_tab(translateLabel("settingsTab"))
lang_idx           = lua_cfg.read("lang_idx")
disableTooltips    = lua_cfg.read("disableTooltips")
disableUiSounds    = lua_cfg.read("disableUiSounds")
useGameLang        = lua_cfg.read("useGameLang")
local selected_lang
local lang_T       = {
  { name = 'English', iso = 'en-US' },
  { name = 'Français', iso = 'fr-FR' },
  { name = 'Deütsch', iso = 'de-DE' },
  -- { name = 'Español',            iso = 'es-ES' },
  { name = 'Italiano', iso = 'it-IT' },
  { name = 'Português (Brasil)', iso = 'pt-BR' },
  { name = 'Русский (Russian)', iso = 'ru-RU' },
  -- { name = 'Chinese (Traditional)', iso = 'zh-TW' },
  -- { name = 'Chinese (Simplified)',  iso = 'zh-CH' },
}

function displayLangs()
  filteredLangs = {}
  for _, lang in ipairs(lang_T) do
    table.insert(filteredLangs, lang.name)
  end
  lang_idx, lang_idxUsed = ImGui.Combo("##langs", lang_idx, filteredLangs, #lang_T)
end

settings_tab:add_imgui(function()
  disableTooltips, dtUsed = ImGui.Checkbox(translateLabel("Disable Tooltips"), disableTooltips)
  if dtUsed then
    lua_cfg.save("disableTooltips", disableTooltips)
    UI.widgetSound("Nav2")
  end

  disableUiSounds, duisndUsed = ImGui.Checkbox(translateLabel("DisableSound"), disableUiSounds)
  UI.toolTip(false, translateLabel("DisableSound_tt"))
  if duisndUsed then
    lua_cfg.save("disableUiSounds", disableUiSounds)
    UI.widgetSound("Nav2")
  end

  disableFlightMusic, dpmUsed = ImGui.Checkbox(translateLabel("flightMusicCB"), disableFlightMusic)
  UI.toolTip(false, translateLabel("flightMusic_tt"))
  if dpmUsed then
    lua_cfg.save("disableFlightMusic", disableFlightMusic)
    UI.widgetSound("Nav2")
    if not disableFlightMusic then
      script.run_in_fiber(function()
        AUDIO.SET_AUDIO_FLAG("DisableFlightMusic", false)
        flight_music_off = false
      end)
    end
  end

  disable_quotes, dqUsed = ImGui.Checkbox(translateLabel("dailyQuotesCB"), disable_quotes)
  UI.toolTip(false, translateLabel("dailyQuotes_tt"))
  if dqUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("disable_quotes", disable_quotes)
  end

  disable_mdef_logs, dmlUsed = ImGui.Checkbox(translateLabel("missileLogsCB"), disable_mdef_logs)
  UI.toolTip(false, translateLabel("missileLogs_tt"))
  if dmlUsed then
    UI.widgetSound("Nav2")
    lua_cfg.save("disable_mdef_logs", disable_mdef_logs)
  end

  ImGui.Spacing()
  if shortcut_anim.anim ~= nil then
    if ImGui.Button(translateLabel("removeShortcut_btn2")) then
      UI.widgetSound("Delete")
      shortcut_anim = {}
      lua_cfg.save("shortcut_anim", {})
      gui.show_success("Samurais Scripts", "Animation shortcut has been reset.")
    end
  else
    ImGui.BeginDisabled()
    ImGui.Button(translateLabel("removeShortcut_btn2"))
    ImGui.EndDisabled()
    UI.toolTip(false, translateLabel("no_shortcut_tt"))
  end

  ImGui.Spacing(); ImGui.Text("Supplies Autofill Delay:")
  ImGui.BeginDisabled(wh1_loop or wh2_loop or wh3_loop or wh4_loop or wh5_loop or hangarLoop)
  ImGui.PushItemWidth(200)
  supply_autofill_delay, safdUsed = ImGui.SliderInt("##autofillDelay", supply_autofill_delay, 500, 60000)
  ImGui.PopItemWidth()
  ImGui.EndDisabled()
  UI.toolTip(false, translateLabel("autofillDelay_tt"))
  ImGui.SameLine(); ImGui.Text(tostring(lua_Fn.round((supply_autofill_delay / 1000), 1)) .. "s")
  if safdUsed then
    UI.widgetSound("Nav")
    lua_cfg.save("supply_autofill_delay", supply_autofill_delay)
    supply_autofill_delay = lua_cfg.read("supply_autofill_delay")
  end

  ImGui.Dummy(1, 10); ImGui.SeparatorText(translateLabel("langTitle"))
  ImGui.Spacing(); ImGui.BulletText(translateLabel("currentLang_txt") .. " " .. current_lang)
  ImGui.Spacing(); useGameLang, uglUsed = ImGui.Checkbox(translateLabel("gameLangCB"), useGameLang)
  if useGameLang then
    UI.toolTip(false, translateLabel("gameLang_tt"))
    LANG, current_lang = Game.GetLang()
  end
  if uglUsed then
    UI.widgetSound("Nav2")
    gui.show_success("Samurai's Scripts", translateLabel("lang_success_msg"))
    lua_cfg.save("useGameLang", useGameLang)
    lua_cfg.save("current_lang", current_lang)
    lua_cfg.save("LANG", LANG)
    lua_cfg.save("lang_idx", 0)
  end

  if not useGameLang then
    ImGui.Text(translateLabel("customLangTxt"))
    ImGui.PushItemWidth(180)
    displayLangs()
    ImGui.PopItemWidth()
    selected_lang = lang_T[lang_idx + 1]
    ImGui.SameLine()
    if ImGui.Button(translateLabel("saveBtn") .. "##lang") then
      UI.widgetSound("Select")
      LANG         = selected_lang.iso
      current_lang = selected_lang.name
      lua_cfg.save("lang_idx", lang_idx)
      lua_cfg.save("LANG", LANG)
      lua_cfg.save("current_lang", current_lang)
      gui.show_success("Samurai's Scripts", translateLabel("lang_success_msg"))
    end
  end

  ImGui.Dummy(10, 1)
  if UI.coloredButton(translateLabel("reset_settings_Btn"), "#FF0000", "#EE4B2B", "#880808", 1) then
    UI.widgetSound("Focus_In")
    ImGui.OpenPopup("Confirm")
  end
  ImGui.SetNextWindowPos(760, 400, ImGuiCond.Appearing)
  ImGui.SetNextWindowBgAlpha(0.8)
  if ImGui.BeginPopupModal("Confirm", ImGuiWindowFlags.AlwaysAutoResize | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.NoTitleBar) then
    UI.coloredText(translateLabel("confirm_txt"), "yellow", 1, 20)
    if ImGui.Button("  " .. translateLabel("yes") .. "  ") then
      UI.widgetSound("Select2")
      SS.reset_settings()
      ImGui.CloseCurrentPopup()
    end
    ImGui.SameLine(); ImGui.Spacing(); ImGui.SameLine()
    if ImGui.Button("  " .. translateLabel("no") .. "  ") then
      UI.widgetSound("Cancel")
      ImGui.CloseCurrentPopup()
    end
    ImGui.EndPopup()
  end
end)

hotkeys_tab = settings_tab:add_tab("Hotkeys ")
hotkeys_tab:add_imgui(function()
  ImGui.BeginTabBar("Keyboard Hotkeys")
  if ImGui.BeginTabItem("Keyboard") then
    ImGui.Dummy(1, 5)

    SS.openHotkeyWindow("Ragdoll On Demand   ", keybinds.rodBtn)

    SS.openHotkeyWindow("Drift Button                ", keybinds.tdBtn)

    SS.openHotkeyWindow("NOS Button                ", keybinds.nosBtn)

    SS.openHotkeyWindow("Stop Anim Button       ", keybinds.stop_anim)

    SS.openHotkeyWindow("Play Anim Button       ", keybinds.play_anim)

    SS.openHotkeyWindow("Previous Anim Button", keybinds.previous_anim)

    SS.openHotkeyWindow("Next Anim Button      ", keybinds.next_anim)

    SS.openHotkeyWindow("Triggerbot Button      ", keybinds.triggerbotBtn)

    SS.openHotkeyWindow("Flatbed Button           ", keybinds.flatbedBtn)

    SS.openHotkeyWindow("Purge Button             ", keybinds.purgeBtn)

    SS.openHotkeyWindow("Toggle Auto-Kill         ", keybinds.autokill)

    SS.openHotkeyWindow("Toggle Enemies Flee ", keybinds.enemiesFlee)

    SS.openHotkeyWindow("Vehicle Mine Button  ", keybinds.vehicle_mine)

    SS.openHotkeyWindow("PANIK!! Button          ", keybinds.panik)
    ImGui.EndTabItem()
  end
  if ImGui.BeginTabItem("Controller") then
    ImGui.Dummy(1, 5)

    SS.gpadHotkeyWindow("Ragdoll On Demand  ", gpad_keybinds.rodBtn)

    SS.gpadHotkeyWindow("Triggerbot Button      ", gpad_keybinds.triggerbotBtn)

    SS.gpadHotkeyWindow("Drift Button               ", gpad_keybinds.tdBtn)

    SS.gpadHotkeyWindow("NOS Button               ", gpad_keybinds.nosBtn)

    SS.gpadHotkeyWindow("Flatbed Button          ", gpad_keybinds.flatbedBtn)

    SS.gpadHotkeyWindow("Purge Button            ", gpad_keybinds.purgeBtn)

    SS.gpadHotkeyWindow("Vehicle Mine Button ", gpad_keybinds.vehicle_mine)
    ImGui.EndTabItem()
  end
  ImGui.EndTabBar()
end)

--[[
-- local function var_reset()
--   resetOnSave()
--   isCrouched = false; is_handsUp = false; anim_music = false; is_playing_radio = false; npc_blips = {}; spawned_npcs = {}; plyrProps = {}; npcProps = {}; selfPTFX = {}; npcPTFX = {}; curr_playing_anim = {}; is_playing_anim = false; is_playing_scenario = false; tab1Sound = true; tab2Sound = true; tab3Sound = true; actions_switch = 0; actions_search =
--   ""; currentMvmt = ""; currentStrf = ""; currentWmvmt = ""; aimBool = false; HashGrabber = false; drew_laser = false; Entity = 0; laserPtfx_T = {}; sound_btn_off = false; tire_smoke = false; purge_started = false; nos_started = false; twostep_started = false; open_sounds_window = false; started_lct = false; launch_active = false; started_popSound = false; started_popSound2 = false; timerA = 0; timerB = 0; defaultXenon = 0; start_rgb_loop = false; vehSound_index = 0; smokePtfx_t = {}; nosptfx_t = {}; purgePtfx_t = {}; lctPtfx_t = {}; popSounds_t = {}; popsPtfx_t = {}; attached_vehicle = 0; tow_xAxis = 0.0; tow_yAxis = 0.0; tow_zAxis = 0.0; pedGrabber = false; ped_grabbed = false;; vehicleGrabber = false; vehicle_grabbed = false; carpool = false; show_npc_veh_ctrls = false; stop_searching = false; hijack_started = false; grp_anim_index = 0; attached_ped = 0; grabbed_veh = 0; thisVeh = 0; pedthrowF = 10; propName =
--   ""; invalidType = ""; preview = false; is_drifting = false; previewLoop = false; activeX = false; activeY = false; activeZ = false; rotX = false; rotY = false; rotZ = false; attached = false; attachToSelf = false; attachToVeh = false; previewStarted = false; isChanged = false; prop = 0; propHash = 0; os_switch = 0; prop_index = 0; objects_index = 0; spawned_index = 0; selectedObject = 0; selected_bone = 0; previewEntity = 0; currentObjectPreview = 0; attached_index = 0; zOffset = 0; spawned_props = {}; spawnedNames = {}; filteredSpawnNames = {}; selfAttachments = {}; selfAttachNames = {}; vehAttachments = {}; vehAttachNames = {}; filteredVehAttachNames = {}; filteredAttachNames = {}; missiledefense = false;
-- end
]]


--[[
    *Threads*
]]

script.register_looped("basic ass loading text", function(balt)
  balt:yield()
  if start_loading_anim then
    loading_label = "-   "
    balt:sleep(80)
    loading_label = "--  "
    balt:sleep(80)
    loading_label = "--- "
    balt:sleep(80)
    loading_label = "----"
    balt:sleep(80)
    loading_label = " ---"
    balt:sleep(80)
    loading_label = "  --"
    balt:sleep(80)
    loading_label = "   -"
    balt:sleep(80)
    loading_label = "    "
    balt:sleep(80)
    return
  end
end)
script.register_looped("shitty rgb text", function(rgbtxt)
  if gui.is_open() and business_tab:is_selected() then
    rgbtxt:sleep(200)
    yrv2_color = { 0, 255, 255, 1 }
    rgbtxt:sleep(200)
    yrv2_color = { 0, 127, 255, 1 }
    rgbtxt:sleep(200)
    yrv2_color = { 0, 0, 255, 1 }
    rgbtxt:sleep(200)
    yrv2_color = { 127, 0, 255, 1 }
    rgbtxt:sleep(200)
    yrv2_color = { 255, 0, 255, 1 }
    rgbtxt:sleep(200)
    yrv2_color = { 255, 0, 127, 1 }
    rgbtxt:sleep(200)
    yrv2_color = { 255, 0, 0, 1 }
    rgbtxt:sleep(200)
    yrv2_color = { 255, 127, 0, 1 }
    rgbtxt:sleep(200)
    yrv2_color = { 255, 255, 0, 1 }
    rgbtxt:sleep(200)
    yrv2_color = { 127, 255, 0, 1 }
    rgbtxt:sleep(200)
    yrv2_color = { 0, 255, 0, 1 }
    rgbtxt:sleep(200)
    yrv2_color = { 0, 255, 127, 1 }
  end
end)
script.register_looped("Quote Of The Day", function(qotd)
  qotd:yield()
  if not disable_quotes then
    if gui.is_open() and Samurais_scripts:is_selected() then
      random_quote = random_quotes_T[math.random(1, #random_quotes_T)]
      qotd:sleep(15000)
    end
  end
end)
script.register_looped("QBE", function(qbe)
  qbe:yield()
  if not disable_quotes then
    if gui.is_open() and Samurais_scripts:is_selected() and random_quote ~= "" then
      if quote_alpha > 0.1 then
        while quote_alpha > 0.1 do
          quote_alpha = quote_alpha - 0.05
          qbe:sleep(100)
        end
      else
        while quote_alpha < 1.0 do
          quote_alpha = quote_alpha + 0.05
          qbe:sleep(100)
        end
      end
    end
  end
end)

-- Game Input
script.register_looped("GameInput", function()
  if is_typing or is_setting_hotkeys then
    PAD.DISABLE_ALL_CONTROL_ACTIONS(0)
  end

  if HashGrabber and WEAPON.IS_PED_ARMED(self.get_ped(), 4) then
    PAD.DISABLE_CONTROL_ACTION(0, 24, true)
    PAD.DISABLE_CONTROL_ACTION(0, 257, true)
  end

  if replaceSneakAnim and Game.Self.isOnFoot() then
    PAD.DISABLE_CONTROL_ACTION(0, 36, true)
  end

  if replacePointAct or is_playing_anim or is_playing_scenario or ped_grabbed or vehicle_grabbed then
    PAD.DISABLE_CONTROL_ACTION(0, 29, true)
  end

  if ducking_in_car then
    PAD.DISABLE_CONTROL_ACTION(0, 73, true)
    PAD.DISABLE_CONTROL_ACTION(0, 75, true)
  end

  if PAD.IS_USING_KEYBOARD_AND_MOUSE(0) then
    pressing_drift_button    = SS.isKeyPressed(keybinds.tdBtn.code)
    pressing_nos_button      = SS.isKeyPressed(keybinds.nosBtn.code)
    pressing_purge_button    = SS.isKeyPressed(keybinds.purgeBtn.code)
    pressing_fltbd_button    = SS.isKeyJustPressed(keybinds.flatbedBtn.code)
    pressing_vmine_button    = SS.isKeyJustPressed(keybinds.vehicle_mine.code)
  else
    pressing_drift_button = gpad_keybinds.tdBtn.code ~= 0 and PAD.IS_CONTROL_PRESSED(0, gpad_keybinds.tdBtn.code)
    pressing_nos_button   = gpad_keybinds.nosBtn.code ~= 0 and PAD.IS_CONTROL_PRESSED(0, gpad_keybinds.nosBtn.code)
    pressing_purge_button = gpad_keybinds.purgeBtn.code ~= 0 and
        (PAD.IS_CONTROL_PRESSED(0, gpad_keybinds.purgeBtn.code) or PAD.IS_DISABLED_CONTROL_PRESSED(0, gpad_keybinds.purgeBtn.code))
    pressing_fltbd_button = gpad_keybinds.flatbedBtn.code ~= 0 and
        (PAD.IS_CONTROL_JUST_PRESSED(0, gpad_keybinds.flatbedBtn.code) or PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, gpad_keybinds.flatbedBtn.code))
    pressing_vmine_button = gpad_keybinds.vehicle_mine.code ~= 0 and
        (PAD.IS_CONTROL_JUST_PRESSED(0, gpad_keybinds.vehicle_mine.code) or PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, gpad_keybinds.vehicle_mine.code))
  end

  if is_in_flatbed then
    if keybinds.flatbedBtn.code == 0x58 or gpad_keybinds.flatbedBtn.code == 73 then
      PAD.DISABLE_CONTROL_ACTION(0, 73, true)
    end
  end

  if nosPurge and Game.Self.isDriving() then
    if validModel and keybinds.purgeBtn.code == 0x58 or gpad_keybinds.purgeBtn.code == 73 then
      PAD.DISABLE_CONTROL_ACTION(0, 73, true)
    end
  end

  if Game.Self.isDriving() then
    if speedBoost and (keybinds.nosBtn.code == 0x10 or gpad_keybinds.nosBtn.code == 21) then
      if PAD.IS_CONTROL_PRESSED(0, 71) and pressing_nos_button then
        if validModel or is_boat or is_bike then
          -- prevent face planting when using NOS mid-air
          PAD.DISABLE_CONTROL_ACTION(0, 60, true)
          PAD.DISABLE_CONTROL_ACTION(0, 61, true)
          PAD.DISABLE_CONTROL_ACTION(0, 62, true)
        end
      end
    end
    if holdF then
      if not is_typing and not is_setting_hotkeys and VEHICLE.IS_VEHICLE_STOPPED(self.get_veh()) and not ducking_in_car then
        PAD.DISABLE_CONTROL_ACTION(0, 75, true)
      else
        timerB = 0
      end
    end
    if keepWheelsTurned then
      if not is_typing and not is_setting_hotkeys and VEHICLE.IS_VEHICLE_STOPPED(self.get_veh()) and (is_car or is_quad) and not ducking_in_car then
        if PAD.IS_CONTROL_PRESSED(0, 34) or PAD.IS_CONTROL_PRESSED(0, 35) then
          PAD.DISABLE_CONTROL_ACTION(0, 75, true)
        end
      end
    end
  end

  if (pedGrabber or vehicleGrabber) and Game.Self.isOnFoot() and not WEAPON.IS_PED_ARMED(self.get_ped(), 7) then
    PAD.DISABLE_CONTROL_ACTION(0, 24, true)
    PAD.DISABLE_CONTROL_ACTION(0, 25, true)
    PAD.DISABLE_CONTROL_ACTION(0, 50, true)
    PAD.DISABLE_CONTROL_ACTION(0, 68, true)
    PAD.DISABLE_CONTROL_ACTION(0, 91, true)
    PAD.DISABLE_CONTROL_ACTION(0, 257, true)
  end
  if ped_grabbed or vehicle_grabbed then
    PAD.DISABLE_CONTROL_ACTION(0, 24, true)
    PAD.DISABLE_CONTROL_ACTION(0, 25, true)
    PAD.DISABLE_CONTROL_ACTION(0, 50, true)
    PAD.DISABLE_CONTROL_ACTION(0, 68, true)
    PAD.DISABLE_CONTROL_ACTION(0, 91, true)
    PAD.DISABLE_CONTROL_ACTION(0, 257, true)
  end
end)

-- self stuff
script.register_looped("auto-heal", function(ah)
  ah:yield()
  if Regen and Game.Self.isAlive() then
    local maxHp  = Game.Self.maxHealth()
    local myHp   = Game.Self.health()
    local myArmr = Game.Self.armour()
    if myHp < maxHp and myHp > 0 then
      if PED.IS_PED_IN_COVER(self.get_ped(), false) then
        ENTITY.SET_ENTITY_HEALTH(self.get_ped(), myHp + 10, 0, 0)
      else
        ENTITY.SET_ENTITY_HEALTH(self.get_ped(), myHp + 1, 0, 0)
      end
    end
    if myArmr == nil then
      PED.SET_PED_ARMOUR(self.get_ped(), 10)
    end
    if myArmr ~= nil and myArmr < 50 then
      PED.ADD_ARMOUR_TO_PED(self.get_ped(), 0.5)
    end
  end
end)

--[[
script.register_looped("objectiveTP", function()
  if objectiveTP then
    if PAD.IS_CONTROL_JUST_PRESSED(0, 57) then
      for _, n in pairs(objectives_T) do
        local blip = HUD.GET_CLOSEST_BLIP_INFO_ID(n)
        if HUD.DOES_BLIP_EXIST(blip) then
          blipCoords = HUD.GET_BLIP_COORDS(blip)
          break
        end
      end
      if blipCoords ~= nil then
        Game.Self.teleport(true, blipCoords)
      else
        gui.show_warning("Objective Teleport", "No objective found!")
      end
    end
  end
end)
]]
script.register_looped("self features", function(script)
  -- Crouch instead of sneak
  if Game.Self.isOnFoot() and not Game.Self.isInWater() and not Game.Self.is_ragdoll() and not gui.is_open() then
    if replaceSneakAnim and not ped_grabbed and not vehicle_grabbed and not is_playing_anim and not is_playing_scenario
      and not is_typing and not is_sitting and not is_setting_hotkeys and not is_hiding then
      if not isCrouched and PAD.IS_DISABLED_CONTROL_PRESSED(0, 36)  and not HUD.IS_MP_TEXT_CHAT_TYPING() then
        script:sleep(200)
        if is_handsUp then
          is_handsUp = false
          TASK.CLEAR_PED_TASKS(self.get_ped())
        end
        while not STREAMING.HAS_CLIP_SET_LOADED("move_ped_crouched") and not STREAMING.HAS_CLIP_SET_LOADED("move_aim_strafe_crouch_2h") do
          STREAMING.REQUEST_CLIP_SET("move_ped_crouched")
          STREAMING.REQUEST_CLIP_SET("move_aim_strafe_crouch_2h")
          coroutine.yield()
        end
        PED.SET_PED_MOVEMENT_CLIPSET(self.get_ped(), "move_ped_crouched", 0.3)
        PED.SET_PED_STRAFE_CLIPSET(self.get_ped(), "move_aim_strafe_crouch_2h")
        script:sleep(500)
        isCrouched = true
      end
    end
    if isCrouched and PAD.IS_DISABLED_CONTROL_PRESSED(0, 36) and not HUD.IS_MP_TEXT_CHAT_TYPING() then
      script:sleep(200)
      PED.RESET_PED_MOVEMENT_CLIPSET(self.get_ped(), 0.3)
      script:sleep(500)
      isCrouched = false
    end
  end

  -- Replace 'Point At' Action
  if not gui.is_open() and not HUD.IS_MP_TEXT_CHAT_TYPING() then
    if Game.Self.isOnFoot() or is_car then
      if replacePointAct and not ped_grabbed and not vehicle_grabbed and not is_playing_anim
      and not is_playing_scenario and not is_typing and not is_setting_hotkeys and not is_hiding then
        if not is_handsUp and PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, 29) and not HUD.IS_MP_TEXT_CHAT_TYPING() then
          script:sleep(200)
          if isCrouched then
            isCrouched = false
            PED.RESET_PED_MOVEMENT_CLIPSET(self.get_ped(), 0)
          end
          if is_sitting then
            TASK.CLEAR_PED_TASKS(self.get_ped())
            is_sitting = false
          end
          playHandsUp()
          is_handsUp = true
        end
      end
    end

    if is_handsUp and PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, 29) and not HUD.IS_MP_TEXT_CHAT_TYPING() then
      script:sleep(200)
      TASK.CLEAR_PED_TASKS(self.get_ped())
      script:sleep(500)
      is_handsUp = false
    end
  end
  if is_handsUp then
    if WEAPON.IS_PED_ARMED(self.get_ped(), 7) then
      if PAD.IS_CONTROL_PRESSED(0, 24) then
        TASK.CLEAR_PED_TASKS(self.get_ped())
        is_handsUp = false
      end
    end
    if PLAYER.IS_PLAYER_FREE_AIMING(self.get_id()) then
      TASK.CLEAR_PED_TASKS(self.get_ped())
      is_handsUp = false
    end
    if not Game.Self.isOnFoot() then
      if PED.IS_PED_SITTING_IN_ANY_VEHICLE(self.get_ped()) and not is_car then
        TASK.CLEAR_PED_TASKS(self.get_ped())
        is_handsUp = false
      end
    end
  end

  -- Online Phone Animations
  if Game.isOnline() then
    if phoneAnim then
      if not ENTITY.IS_ENTITY_DEAD(self.get_ped(), false) and not is_playing_anim and not is_playing_scenario
      and not ped_grabbed and not vehicle_grabbed and not is_handsUp and not is_sitting
      and not is_hiding and PED.COUNT_PEDS_IN_COMBAT_WITH_TARGET(self.get_ped()) == 0 then
        if not phoneAnimsEnabled then
          Game.Self.PhoneAnims(true)
          phoneAnimsEnabled = true
        end
        if phoneAnimsEnabled then
          Game.Self.PlayPhoneGestures(script)
        end
      else
        if phoneAnimsEnabled then
          Game.Self.PhoneAnims(false)
          phoneAnimsEnabled = false
        end
      end
    else
      if phoneAnimsEnabled then
        Game.Self.PhoneAnims(false)
        phoneAnimsEnabled = false
      end
    end
  end

  -- Sprint Inside
  if sprintInside then
    if not PED.GET_PED_CONFIG_FLAG(self.get_ped(), 427, true) then
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 427, true)
    end
  else
    if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 427, true) then
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 427, false)
    end
  end

  -- Lockpick animation
  if lockPick then
    if not PED.GET_PED_CONFIG_FLAG(self.get_ped(), 426, true) then
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 426, true)
    end
  else
    if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 426, true) then
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 426, false)
    end
  end
end)
script.register_looped("Ragdoll Loop", function(rgdl)
  rgdl:yield()
  if clumsy then
    if PED.IS_PED_RAGDOLL(self.get_ped()) then
      rgdl:sleep(2500)
      return
    end
    PED.SET_PED_RAGDOLL_ON_COLLISION(self.get_ped(), true)
    if isCrouched then
      isCrouched = false
    end
    if is_handsUp then
      is_handsUp = false
    end
  elseif rod and not is_hiding then
    if PED.CAN_PED_RAGDOLL(self.get_ped()) then
      if PAD.IS_CONTROL_PRESSED(0, 252) and Game.getEntityModel(self.get_veh()) ~= 884483972 and Game.getEntityModel(self.get_veh()) ~= 2069146067 then
        PED.SET_PED_TO_RAGDOLL(self.get_ped(), 1500, 0, 0, false, false, false)
        if isCrouched then
          isCrouched = false
        end
        if is_handsUp then
          is_handsUp = false
        end
      end
    else
      if Game.Self.isOnFoot() and PAD.IS_CONTROL_JUST_PRESSED(0, 252) then
        gui.show_error("Samurais Scripts",
          "Unable to ragdoll you.\nPlease make sure 'No Ragdoll' option\nis disabled in YimMenu.")
        rgdl:sleep(200)
      end
    end
  end
  if ragdoll_sound then
    if PED.IS_PED_RAGDOLL(self.get_ped()) and Game.isOnline() then
      local soundName
      if PED.IS_PED_MALE(self.get_ped()) then
        soundName = "WAVELOAD_PAIN_MALE"
      else
        soundName = "WAVELOAD_PAIN_FEMALE"
      end
      rgdl:sleep(500)
      local myPos = ENTITY.GET_ENTITY_COORDS(self.get_ped(), true)
      AUDIO.PLAY_AMBIENT_SPEECH_FROM_POSITION_NATIVE("SCREAM_PANIC_SHORT", soundName, myPos.x, myPos.y, myPos.z,
        "SPEECH_PARAMS_FORCE_SHOUTED")
      repeat
        rgdl:sleep(100)
      until
        PED.IS_PED_RAGDOLL(self.get_ped()) == false
    end
  end
end)
script.register_looped("Anim S/VFX", function(animSfx)
  if is_playing_anim then
    if curr_playing_anim.sfx ~= nil then
      local soundCoords = self.get_pos()
      AUDIO.PLAY_AMBIENT_SPEECH_FROM_POSITION_NATIVE(curr_playing_anim.sfx, curr_playing_anim.sfxName, soundCoords.x, soundCoords.y,
        soundCoords.z, curr_playing_anim.sfxFlg)
      animSfx:sleep(10000)
    elseif string.find(string.lower(curr_playing_anim.name), "police torch") then
      local myPos = self.get_pos()
      local torch = OBJECT.GET_CLOSEST_OBJECT_OF_TYPE(myPos.x, myPos.y, myPos.z, 1, curr_playing_anim.prop1, false, false, false)
      if ENTITY.DOES_ENTITY_EXIST(torch) then
        local torchPos = ENTITY.GET_ENTITY_COORDS(torch, false)
        local torchFwd = Game.getForwardVec(torch)
        GRAPHICS.DRAW_SPOT_LIGHT(torchPos.x, torchPos.y, torchPos.z - 0.2,
          (torchFwd.x * -1), (torchFwd.y * -1), torchFwd.z, 226, 130, 78,
          10.0, 40.0, 1.0, 20.0, 0.0
        )
      end
    end
  end
end)
script.register_looped("Hide From Cops", function(hfc)
  if hideFromCops then
    local isWanted    = PLAYER.GET_PLAYER_WANTED_LEVEL(self.get_id()) > 0
    local was_spotted = PLAYER.IS_WANTED_AND_HAS_BEEN_SEEN_BY_COPS(self.get_id())
    if not is_hiding then
      if Game.Self.isDriving() and is_car and VEHICLE.IS_VEHICLE_STOPPED(self.get_veh()) and not PAD.IS_CONTROL_PRESSED(0, 71)
        and not PAD.IS_CONTROL_PRESSED(0, 72) and VEHICLE.IS_VEHICLE_ON_ALL_WHEELS(self.get_veh()) and isWanted and not was_spotted then
        Game.showButtonPrompt("Press ~INPUT_FRONTEND_ACCEPT~ to hide inside your car.")
        if PAD.IS_CONTROL_JUST_PRESSED(0, 201) and not HUD.IS_MP_TEXT_CHAT_TYPING() then
          if is_handsUp then
            TASK.CLEAR_PED_TASKS(self.get_ped())
            is_handsUp = false
          end
          if Game.requestAnimDict("missmic3leadinout_mcs1") then
            VEHICLE.SET_VEHICLE_IS_WANTED(self.get_veh(), false)
            VEHICLE.SET_VEHICLE_ENGINE_ON(self.get_veh(), false, false, true)
            TASK.TASK_PLAY_ANIM(self.get_ped(), "missmic3leadinout_mcs1", "cockpit_pilot", 6.0, 3.0, -1, 18, 1.0, false, false, false)
            is_hiding, ducking_in_car = true, true
            hfc:sleep(1000)
          end
        end
      end
      if Game.Self.isOnFoot() then
        local nearBoot, vehicle = SS.isNearCarTrunk()
        local nearBin, bin      = SS.isNearTrashBin()
        if not nearBoot and not nearBin then
          hfc:sleep(100)
        end
        if nearBoot and not is_playing_anim and not is_playing_scenario and not ped_grabbed and not vehicle_grabbed then
          Game.showButtonPrompt("Press ~INPUT_PICKUP~ to hide in the trunk.")
          if PAD.IS_CONTROL_JUST_PRESSED(0, 38) then
            local z_offset = 0.7
            if is_handsUp then
              TASK.CLEAR_PED_TASKS(self.get_ped())
              is_handsUp = false
            end
            if isCrouched then
              PED.RESET_PED_MOVEMENT_CLIPSET(self.get_ped(), 0)
              isCrouched = false
            end
            if not was_spotted then
              if Game.Vehicle.class(vehicle) == "Vans" then
                bootDoorID = 3
                z_offset = 1.1
              else
                if Game.Vehicle.class(vehicle) == "SUVs" then
                  z_offset = 1.2
                end
                bootDoorID = 5
              end
              ENTITY.FREEZE_ENTITY_POSITION(self.get_ped(), true)
              ENTITY.SET_ENTITY_COLLISION(self.get_ped(), false, true)
              hfc:sleep(50)
              VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, bootDoorID, false, false)
              hfc:sleep(500)
              ENTITY.FREEZE_ENTITY_POSITION(self.get_ped(), false)
              local chassis_bone = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(vehicle, "chassis_dummy")
              local veh_hash     = ENTITY.GET_ENTITY_MODEL(vehicle)
              local vmin, vmax   = Game.getModelDimensions(veh_hash, hfc)
              local veh_len      = vmax.y - vmin.y
              if Game.requestAnimDict("timetable@tracy@sleep@") then
                TASK.TASK_PLAY_ANIM(self.get_ped(), "timetable@tracy@sleep@", "base", 4.0, -4.0, -1, 2, 1.0, false, false, false)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(self.get_ped(), vehicle, chassis_bone, -0.3, - veh_len / 3, z_offset, 180.0, 0.0, 0.0, false,
                false, false, false, 20, true, 1)
                hfc:sleep(500)
                VEHICLE.SET_VEHICLE_DOOR_SHUT(vehicle, bootDoorID, false)
                ENTITY.SET_ENTITY_COLLISION(self.get_ped(), true, true)
                is_hiding, hiding_in_boot, boot_vehicle = true, true, vehicle
                hfc:sleep(1000)
              end
            else
              gui.show_warning("Samurai's Scripts", "The cops have spotted you. You can't hide until they lose sight of you.")
            end
          end
        end
        if nearBin and not is_playing_anim and not is_playing_scenario and not ped_grabbed and not vehicle_grabbed then
          Game.showButtonPrompt("Press ~INPUT_PICKUP~ to hide in the dumpster")
          if PAD.IS_CONTROL_JUST_PRESSED(0, 38) then
            if is_handsUp then
              TASK.CLEAR_PED_TASKS(self.get_ped())
              is_handsUp = false
            end
            if isCrouched then
              PED.RESET_PED_MOVEMENT_CLIPSET(self.get_ped(), 0)
              isCrouched = false
            end
            if not was_spotted then
              if ENTITY.DOES_ENTITY_EXIST(bin) then
                -- should I add screen fade in/out to make it fancier? hmm! probably not.
                TASK.TASK_TURN_PED_TO_FACE_ENTITY(self.get_ped(), bin, 10)
                CAM.DO_SCREEN_FADE_OUT(500)
                hfc:sleep(1000)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(self.get_ped(), bin, -1, 0.0, 0.12, 1.13, 0.0, 0.0, 90.0, false,
                false, false, false, 20, true, 1)
                if Game.requestAnimDict("anim@amb@inspect@crouch@male_a@base") then
                  TASK.TASK_PLAY_ANIM(self.get_ped(), "anim@amb@inspect@crouch@male_a@base", "base", 4.0, -4.0, -1, 1, 1.0, false, false, false)
                end
                CAM.DO_SCREEN_FADE_IN(500)
                hfc:sleep(1000)
                is_hiding, hiding_in_dumpster, thisDumpster = true, true, bin
              end
            else
              gui.show_warning("Samurai's Scripts", "The cops have spotted you! You can't hide until they lose sight of you.")
            end
          end
        end
      end
    end
  end
  if is_hiding then
    if not Game.Self.isAlive() then
      is_hiding, ducking_in_car, hiding_in_boot, hiding_in_dumpster, boot_vehicle, thisDumpster = false, false, false, false, 0, 0
    end
    if ducking_in_car and not ENTITY.DOES_ENTITY_EXIST(self.get_veh()) then
      TASK.CLEAR_PED_TASKS(self.get_ped())
      is_hiding, ducking_in_car = false, false
    end
    if hiding_in_boot and not ENTITY.DOES_ENTITY_EXIST(boot_vehicle) then
      TASK.CLEAR_PED_TASKS(self.get_ped())
      is_hiding, hiding_in_boot, boot_vehicle = false, false, 0
    end
    if hiding_in_dumpster and not ENTITY.DOES_ENTITY_EXIST(thisDumpster) then
      TASK.CLEAR_PED_TASKS(self.get_ped())
      is_hiding, hiding_in_dumpster, thisDumpster = false, false, 0
    end
    local isWanted    = PLAYER.GET_PLAYER_WANTED_LEVEL(self.get_id()) > 0
    local was_spotted = PLAYER.IS_WANTED_AND_HAS_BEEN_SEEN_BY_COPS(self.get_id())
    if isWanted and not was_spotted then
      PED.SET_COP_PERCEPTION_OVERRIDES(40.0, 40.0, 40.0, 100.0, 100.0, 100.0, 0.0)
    end
    if ducking_in_car then
      if was_spotted then
        gui.show_warning("Samurai's Scripts", "You have been spotted by the cops! You can't hide until they lose sight of you.")
        TASK.CLEAR_PED_TASKS(self.get_ped())
        is_hiding, ducking_in_car = false, false
      end
      Game.showButtonPrompt("Press ~INPUT_FRONTEND_ACCEPT~ or ~INPUT_VEH_ACCELERATE~ or ~INPUT_VEH_BRAKE~ to stop hiding.")
      if PAD.IS_CONTROL_JUST_PRESSED(0, 201) or PAD.IS_CONTROL_PRESSED(0, 71)
        or PAD.IS_CONTROL_PRESSED(0, 72) and not HUD.IS_MP_TEXT_CHAT_TYPING() then
        VEHICLE.SET_VEHICLE_ENGINE_ON(self.get_veh(), true, false, false)
        TASK.CLEAR_PED_TASKS(self.get_ped())
        is_hiding, ducking_in_car = false, false
        hfc:sleep(1000)
      end
    end
    if hiding_in_boot then
      Game.showButtonPrompt("Press ~INPUT_PICKUP~ to get out.")
      if PAD.IS_CONTROL_JUST_PRESSED(0, 38) then
        local my_pos      = self.get_pos()
        local veh_fwd     = ENTITY.GET_ENTITY_FORWARD_VECTOR(boot_vehicle)
        local _, ground_z = MISC.GET_GROUND_Z_FOR_3D_COORD(my_pos.x, my_pos.y, my_pos.z, ground_z, false, false)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(boot_vehicle, bootDoorID, false, false)
        hfc:sleep(500)
        TASK.CLEAR_PED_TASKS(self.get_ped())
        ENTITY.DETACH_ENTITY(self.get_ped(), true, true)
        ENTITY.SET_ENTITY_COORDS(self.get_ped(), my_pos.x - (veh_fwd.x * 1.3),
        my_pos.y - (veh_fwd.y * 1.3), ground_z, false, false, false, false)
        ENTITY.SET_ENTITY_HEADING(self.get_ped(), (ENTITY.GET_ENTITY_HEADING(self.get_ped()) - 180))
        VEHICLE.SET_VEHICLE_DOOR_SHUT(boot_vehicle, bootDoorID, false)
        is_hiding, hiding_in_boot, boot_vehicle = false, false, 0
        hfc:sleep(1000)
      end
    end
    if hiding_in_dumpster then
      Game.showButtonPrompt("Press ~INPUT_PICKUP~ to get out.")
      if PAD.IS_CONTROL_JUST_PRESSED(0, 38) then
        CAM.DO_SCREEN_FADE_OUT(500)
        hfc:sleep(1000)
        local my_pos      = self.get_pos()
        local _, ground_z = MISC.GET_GROUND_Z_FOR_3D_COORD(my_pos.x, my_pos.y, my_pos.z, ground_z, false, false)
        ENTITY.DETACH_ENTITY(self.get_ped(), true, false)
        ENTITY.SET_ENTITY_HEADING(self.get_ped(), (ENTITY.GET_ENTITY_HEADING(self.get_ped()) + 90))
        TASK.CLEAR_PED_TASKS(self.get_ped())
        local my_fwd = Game.getForwardVec(self.get_ped())
        ENTITY.SET_ENTITY_COORDS(self.get_ped(), my_pos.x + (my_fwd.x * 1.3),
        my_pos.y + (my_fwd.y * 1.3), ground_z, false, false, false, false)
        CAM.DO_SCREEN_FADE_IN(500)
        hfc:sleep(1000)
        is_hiding, hiding_in_dumpster = false, false
      end
    end
  end
end)

-- Actions
script.register_looped("anim_interrupt_event", function(aiev)
  if is_playing_anim then
    if curr_playing_anim.autoOff then
      is_playing_anim = false
    end
    if Game.Self.isAlive() then
      aiev:sleep(1000)
      if is_playing_anim and not ENTITY.IS_ENTITY_PLAYING_ANIM(self.get_ped(), curr_playing_anim.dict, curr_playing_anim.anim, 3) and not SS.isKeyJustPressed(keybinds.stop_anim.code) then
        if PED.IS_PED_RAGDOLL(self.get_ped()) then
          repeat
            aiev:sleep(500)
          until not PED.IS_PED_RAGDOLL(self.get_ped())
          if Game.Self.isAlive() and not SS.isKeyJustPressed(keybinds.stop_anim.code) then -- we're still alive and we didn't manually stop it
            onAnimInterrupt(aiev)
          end
        elseif PED.IS_PED_FALLING(self.get_ped()) then
          repeat
            aiev:sleep(500)
          until not PED.IS_PED_FALLING(self.get_ped())
          if Game.Self.isAlive() and not SS.isKeyJustPressed(keybinds.stop_anim.code) then
            onAnimInterrupt(aiev)
          end
        else
          aiev:sleep(100)
          if Game.Self.isAlive() and not SS.isKeyJustPressed(keybinds.stop_anim.code) then
            onAnimInterrupt(aiev)
          end
        end
      end
    else
      is_playing_anim = false
      if plyrProps[1] ~= nil then
        for _, p in ipairs(plyrProps) do
          if ENTITY.DOES_ENTITY_EXIST(p) then
            ENTITY.DELETE_ENTITY(p)
          end
        end
      end
    end
  end

  if is_playing_scenario then
    if not Game.Self.isAlive() then
      if bbq ~= nil and ENTITY.DOES_ENTITY_EXIST(bbq) then
        ENTITY.DELETE_ENTITY(bbq)
      end
      is_playing_scenario = false
    end
  end
end)
script.register_looped("MISC Anim Stuff", function(miscanim)
  miscanim:yield()
  if is_playing_anim or is_shortcut_anim then
    PED.SET_PED_CAN_SWITCH_WEAPON(self.get_ped(), false)
    if WEAPON.IS_PED_ARMED(self.get_ped(), 7) then
      WEAPON.SET_CURRENT_PED_WEAPON(self.get_ped(), 0xA2719263, false)
    end
    if ENTITY.IS_ENTITY_PLAYING_ANIM(self.get_ped(), "mp_suicide", "pistol", 3) then
      for _, w in ipairs(handguns_T) do
        if WEAPON.HAS_PED_GOT_WEAPON(self.get_ped(), w, false) then
          WEAPON.SET_CURRENT_PED_WEAPON(self.get_ped(), w, true)
          break
        end
      end
      miscanim:sleep(555)
      AUDIO.PLAY_SOUND_FRONTEND(-1, "SNIPER_FIRE", "DLC_BIKER_RESUPPLY_MEET_CONTACT_SOUNDS", true)
      repeat
        miscanim:sleep(10)
      until ENTITY.IS_ENTITY_PLAYING_ANIM(self.get_ped(), "mp_suicide", "pistol", 3) == false
      PED.SET_PED_CAN_SWITCH_WEAPON(self.get_ped(), true)
    end
    repeat
      miscanim:sleep(10)
    until is_playing_anim == false or is_shortcut_anim == false
    PED.SET_PED_CAN_SWITCH_WEAPON(self.get_ped(), true)
  end
end)

--[[
script.register_looped("on_game_mode_switch", function(ogms) -- <- it was behaving nice by resetting variables on session or game mode switches
  if Game.isOnline() then                                      --  then it started causing problems.
    if NETWORK.NETWORK_IS_IN_SESSION() then
      repeat
        ogms:sleep(1000)
      until not NETWORK.NETWORK_IS_IN_SESSION()
      if is_playing_anim or is_playing_scenario or ped_grabbed then
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(self.get_ped())
      end
      if is_playing_radio or anim_music then
        play_music("stop")
      end
      var_reset()
    end
  else
    repeat
      ogms:sleep(1000)
    until NETWORK.NETWORK_IS_SESSION_STARTED()
    if is_playing_anim or is_playing_scenario or ped_grabbed then
      TASK.CLEAR_PED_TASKS_IMMEDIATELY(self.get_ped())
    end
    if is_playing_radio or anim_music then
      play_music("stop")
    end
    var_reset()
  end
end)
]]

script.register_looped("animation hotkey", function(script)
  script:yield()
  if is_playing_anim then
    if SS.isKeyJustPressed(keybinds.stop_anim.code) then
      cleanup(script)
      is_playing_anim  = false
      is_shortcut_anim = false
      if anim_music then
        play_music("stop")
        anim_music = false
      end
      if spawned_npcs[1] ~= nil then
        cleanupNPC(script)
      end
    end
  end
  if usePlayKey then
    if filteredAnims == nil then
      updatefilteredAnims()
    end
    if SS.isKeyJustPressed(keybinds.next_anim.code) then
      anim_index = anim_index + 1
      info = filteredAnims[anim_index + 1]
      if info == nil then
        anim_index = 0
        info = filteredAnims[anim_index + 1]
        gui.show_message("Current Animation:", info.name)
      end
      if info ~= nil then
        gui.show_message("Current Animation:", info.name)
      end
    elseif SS.isKeyJustPressed(keybinds.previous_anim.code) and anim_index > 0 then -- prevent going to index 0 which breaks the script.
      anim_index = anim_index - 1
      info = filteredAnims[anim_index + 1]
      gui.show_message("Current Animation:", info.name)
      script:sleep(200)
    elseif SS.isKeyJustPressed(keybinds.previous_anim.code) and anim_index == 0 then
      info = filteredAnims[anim_index + 1]
      gui.show_warning("Current Animation:", info.name .. "\10\10You have reached the top of the list.")
      script:sleep(400)
    end
    if SS.isKeyJustPressed(keybinds.play_anim.code) then
      if not ped_grabbed and not vehicle_grabbed and not is_hiding then
        if not is_playing_anim then
          if info ~= nil then
            local mycoords     = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
            local myheading    = ENTITY.GET_ENTITY_HEADING(self.get_ped())
            local myforwardX   = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
            local myforwardY   = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
            local myboneIndex  = PED.GET_PED_BONE_INDEX(self.get_ped(), info.boneID)
            local mybonecoords = PED.GET_PED_BONE_COORDS(self.get_ped(), info.boneID, 0.0, 0.0, 0.0)
            if manualFlags then
              setmanualflag()
            else
              flag = info.flag
            end
            if is_sitting or is_handsUp then
              TASK.CLEAR_PED_TASKS(self.get_ped())
              is_sitting, is_handsUp = false, false
            end
            if isCrouched then
              PED.RESET_PED_MOVEMENT_CLIPSET(self.get_ped(), 0)
              isCrouched = false
            end
            playAnim(info, self.get_ped(), flag, selfprop1, selfprop2, selfloopedFX, selfSexPed, myboneIndex, mycoords,
              myheading, myforwardX, myforwardY, mybonecoords, "self", plyrProps, selfPTFX, script
            )
            curr_playing_anim = info
            is_playing_anim   = true
            if lua_Fn.str_contains(curr_playing_anim.name, "DJ") then
              if not is_playing_radio then
                play_music("start", "RADIO_22_DLC_BATTLE_MIX1_RADIO")
                anim_music = true
              end
            end
            script:sleep(200)
          end
        else
          PAD.SET_CONTROL_SHAKE(0, 500, 250)
          gui.show_warning("Samurais Scripts",
            "Press " .. STOP_ANIM_BUTTON .. " to stop the current animation before playing the next one.")
          script:sleep(800)
        end
      else
        gui.show_error("Samurais Scripts",
          "You can not play animations while grabbing an NPC.")
        script:sleep(800)
      end
    end
  end
  if npc_blips[1] ~= nil then
    for _, b in ipairs(npc_blips) do
      if HUD.DOES_BLIP_EXIST(b) then
        for _, npc in ipairs(spawned_npcs) do
          if PED.IS_PED_SITTING_IN_ANY_VEHICLE(npc) then
            HUD.SET_BLIP_ALPHA(b, 0.0)
          else
            HUD.SET_BLIP_ALPHA(b, 1000.0)
          end
        end
      end
    end
  end
  if spawned_npcs[1] ~= nil then
    for _, npc in ipairs(spawned_npcs) do
      local myPos    = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
      local fwdX     = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
      local fwdY     = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
      local npcPos   = ENTITY.GET_ENTITY_COORDS(npc, false)
      local distCalc = SYSTEM.VDIST(myPos.x, myPos.y, myPos.z, npcPos.x, npcPos.y, npcPos.z)
      if distCalc > 100 then
        script:sleep(1000)
        TASK.CLEAR_PED_TASKS(npc)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(npc, myPos.x - (fwdX * 2), myPos.y - (fwdY * 2), myPos.z, true, false, false)
      end
    end
  end

  if is_playing_scenario then
    if SS.isKeyJustPressed(keybinds.stop_anim.code) then
      Game.busySpinnerOn(translateLabel("scenarios_spinner"), 3)
      TASK.CLEAR_PED_TASKS(self.get_ped())
      is_playing_scenario = false
      script:sleep(1000)
      Game.busySpinnerOff()
      if ENTITY.DOES_ENTITY_EXIST(bbq) then
        ENTITY.DELETE_ENTITY(bbq)
      end
    end
  end
end)

-- Animation Shotrcut
script.register_looped("anim shortcut", function(animsc)
  if shortcut_anim.anim ~= nil and not gui.is_open() and not ped_grabbed and not vehicle_grabbed and not is_hiding then
    if SS.isKeyJustPressed(shortcut_anim.btn) and not is_typing and not is_setting_hotkeys and not is_playing_anim and not is_playing_scenario then
      is_shortcut_anim   = true
      info               = shortcut_anim
      local mycoords     = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
      local myheading    = ENTITY.GET_ENTITY_HEADING(self.get_ped())
      local myforwardX   = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
      local myforwardY   = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
      local myboneIndex  = PED.GET_PED_BONE_INDEX(self.get_ped(), info.boneID)
      local mybonecoords = PED.GET_PED_BONE_COORDS(self.get_ped(), info.boneID, 0.0, 0.0, 0.0)
      if is_playing_anim or is_playing_scenario then
        cleanup(animsc)
        if ENTITY.DOES_ENTITY_EXIST(bbq) then
          ENTITY.DELETE_ENTITY(bbq)
        end
        is_playing_anim     = false
        is_playing_scenario = false
        animsc:sleep(500)
      end
      if is_handsUp then
        TASK.CLEAR_PED_TASKS(self.get_ped())
        is_handsUp = false
        animsc:sleep(100)
      end
      if is_sitting then
        TASK.CLEAR_PED_TASKS(self.get_ped())
        is_sitting = false
        animsc:sleep(100)
      end
      if isCrouched then
        PED.RESET_PED_MOVEMENT_CLIPSET(self.get_ped(), 0)
        isCrouched = false
        animsc:sleep(100)
      end
      if Game.requestAnimDict(shortcut_anim.dict) then
        playAnim(shortcut_anim, self.get_ped(), shortcut_anim.flag, selfprop1, selfprop2, selfloopedFX, selfSexPed,
          myboneIndex, mycoords, myheading, myforwardX, myforwardY, mybonecoords, "self", plyrProps, selfPTFX, animsc
        )
        curr_playing_anim = shortcut_anim
        if lua_Fn.str_contains(shortcut_anim.name, "DJ") then
          if not is_playing_radio then
            play_music("start", "RADIO_22_DLC_BATTLE_MIX1_RADIO")
            anim_music = true
          end
        end
        animsc:sleep(100)
        curr_playing_anim = shortcut_anim
        is_playing_anim  = true
        is_shortcut_anim = true
      end
    end
  end
  if is_shortcut_anim and SS.isKeyJustPressed(shortcut_anim.btn) then
    animsc:sleep(100)
    cleanup(animsc)
    is_playing_anim  = false
    is_shortcut_anim = false
  end
end)

-- Action Mode
script.register_looped("action mode", function(amode)
  if disableActionMode then
    if PED.IS_PED_USING_ACTION_MODE(self.get_ped()) then
      PLAYER.SET_DISABLE_AMBIENT_MELEE_MOVE(self.get_id(), true)
      PED.SET_PED_USING_ACTION_MODE(self.get_ped(), false, -1, "DEFAULT_ACTION")
    else
      amode:sleep(500)
    end
    amode:yield()
  end
end)
script.register_looped("npc stuff", function(npcStuff)
  if spawned_npcs[1] ~= nil then
    for k, v in ipairs(spawned_npcs) do
      if ENTITY.DOES_ENTITY_EXIST(v) then
        if ENTITY.IS_ENTITY_DEAD(v, false) then
          PED.REMOVE_PED_FROM_GROUP(v)
          npcStuff:sleep(3000)
          PED.DELETE_PED(v)
          table.remove(spawned_npcs, k)
        end
      end
    end
  end
end)

-- weapon stuff
script.register_looped("HashGrabber", function(hg)
  if HashGrabber then
    if WEAPON.IS_PED_ARMED(self.get_ped(), 4) and PLAYER.IS_PLAYER_FREE_AIMING(self.get_id()) and PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, 24) then
      local ent  = Game.getAimedEntity()
      local hash = Game.getEntityModel(ent)
      local type = Game.getEntityTypeString(ent)
      log.debug("\n----- Info Gun -----" ..
        "\n¤ Handle: " .. tostring(ent) .. "\n¤ Hash:   " .. tostring(hash) .. "\n¤ Type:   " .. tostring(type))
    end
  end
  hg:yield()
end)
script.register_looped("TriggerBot", function(trgrbot)
  if Triggerbot then
    if PLAYER.IS_PLAYER_FREE_AIMING(PLAYER.PLAYER_ID()) then
      aimBool, Entity = PLAYER.GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(PLAYER.PLAYER_ID(), Entity)
      if aimBool then
        if ENTITY.IS_ENTITY_A_PED(Entity) and PED.IS_PED_HUMAN(Entity) then
          local bonePos = ENTITY.GET_WORLD_POSITION_OF_ENTITY_BONE(Entity,
            ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(Entity, "head"))
          weapon = Game.Self.weapon()
          if WEAPON.IS_PED_WEAPON_READY_TO_SHOOT(self.get_ped()) and Game.Self.isOnFoot() and not PED.IS_PED_RELOADING(self.get_ped()) then
            if not ENTITY.IS_ENTITY_DEAD(Entity, false) then
              if PAD.IS_CONTROL_PRESSED(0, 21) then
                if aimEnemy then
                  if PED.IS_PED_IN_COMBAT(Entity, self.get_ped()) then
                    TASK.TASK_AIM_GUN_AT_COORD(self.get_ped(), bonePos.x, bonePos.y, bonePos.z, 250, true, false)
                    TASK.TASK_SHOOT_AT_COORD(self.get_ped(), bonePos.x, bonePos.y, bonePos.z, 250, 2556319013)
                  end
                else
                  TASK.TASK_AIM_GUN_AT_COORD(self.get_ped(), bonePos.x, bonePos.y, bonePos.z, 250, true, false)
                  TASK.TASK_SHOOT_AT_COORD(self.get_ped(), bonePos.x, bonePos.y, bonePos.z, 250, 2556319013)
                end
              end
            end
          end
        end
      else
        Entity = 0
      end
    else
      bool = false
    end
  end
  trgrbot:yield()
end)
script.register_looped("auto-kill-enemies", function(ak)
  if autoKill then
    local myCoords = self.get_pos()
    local gta_peds = entities.get_all_peds_as_handles()
    if (PED.COUNT_PEDS_IN_COMBAT_WITH_TARGET_WITHIN_RADIUS(self.get_ped(), myCoords.x, myCoords.y, myCoords.z, 500)) > 0 then
      ak:sleep(10)
      for _, p in pairs(gta_peds) do
        if PED.IS_PED_HUMAN(p) and PED.IS_PED_IN_COMBAT(p, self.get_ped()) and not PED.IS_PED_A_PLAYER(p) then
          if PED.IS_PED_IN_ANY_VEHICLE(p, false) then
            local enemy_vehicle        = PED.GET_VEHICLE_PED_IS_IN(p, false)
            local enemy_vehicle_coords = ENTITY.GET_ENTITY_COORDS(enemy_vehicle, true)
            local dist                 = SYSTEM.VDIST(enemy_vehicle_coords.x, enemy_vehicle_coords.y,
              enemy_vehicle_coords.z, myCoords.x, myCoords.y, myCoords.z)
            if dist >= 20 then
              VEHICLE.SET_VEHICLE_ENGINE_HEALTH(enemy_vehicle, -4000)
              if VEHICLE.IS_THIS_MODEL_A_BIKE(ENTITY.GET_ENTITY_MODEL(enemy_vehicle)) or VEHICLE.IS_THIS_MODEL_A_CAR(ENTITY.GET_ENTITY_MODEL(enemy_vehicle)) then
                for i = 0, 7 do
                  VEHICLE.SET_VEHICLE_TYRE_BURST(enemy_vehicle, i, false, 1000.0)
                end
              end
              PED.APPLY_DAMAGE_TO_PED(p, 100000, true, 0, 0x7FD62962)
              -- NETWORK.NETWORK_EXPLODE_VEHICLE(enemy_vehicle, true, false, 0)
            end
          else
            PED.APPLY_DAMAGE_TO_PED(p, 100000, true, 0, 0x7FD62962)
          end
        end
      end
    end
  end
end)
script.register_looped("enemies-flee", function(ef)
  if runaway then
    local myCoords = self.get_pos()
    local gta_peds = entities.get_all_peds_as_handles()
    if (PED.COUNT_PEDS_IN_COMBAT_WITH_TARGET_WITHIN_RADIUS(self.get_ped(), myCoords.x, myCoords.y, myCoords.z, 100)) > 0 then
      for _, p in pairs(gta_peds) do
        if PED.IS_PED_HUMAN(p) and PED.IS_PED_IN_COMBAT(p, self.get_ped()) and not PED.IS_PED_A_PLAYER(p) then
          TASK.CLEAR_PED_SECONDARY_TASK(p)
          TASK.CLEAR_PED_TASKS(p)
          PED.SET_PED_KEEP_TASK(p, false)
          PED.SET_PED_COMBAT_ATTRIBUTES(p, 5, false)
          PED.SET_PED_COMBAT_ATTRIBUTES(p, 13, false)
          PED.SET_PED_COMBAT_ATTRIBUTES(p, 31, false)
          PED.SET_PED_COMBAT_ATTRIBUTES(p, 50, false)
          PED.SET_PED_COMBAT_ATTRIBUTES(p, 58, false)
          PED.SET_PED_COMBAT_ATTRIBUTES(p, 17, true)
          PED.SET_PED_COMBAT_ATTRIBUTES(p, 77, true)
          if WEAPON.IS_PED_ARMED(p, 7) then
            WEAPON.SET_PED_DROPS_WEAPON(p)
          end
          if PED.IS_PED_IN_ANY_VEHICLE(p, false) then
            TASK.TASK_VEHICLE_TEMP_ACTION(p, PED.GET_VEHICLE_PED_IS_USING(p), 1, 2000)
            TASK.TASK_LEAVE_ANY_VEHICLE(p, 0, 4160)
          end
          TASK.TASK_SMART_FLEE_PED(p, self.get_ped(), 250, 5000, false, false)
        end
      end
    end
  end
  ef:yield()
end)
script.register_looped("Katana", function(rpq)
  rpq:yield()
  if replace_pool_q then
    if WEAPON.IS_PED_ARMED(self.get_ped(), 1) and WEAPON.GET_SELECTED_PED_WEAPON(self.get_ped()) == 0xDD5DF8D9 then
      local pool_q   = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(self.get_ped(), 0)
      local q_coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pool_q, 0.0, 0.0, 0.0)
      if ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(pool_q, self.get_ped()) then
        if not ENTITY.DOES_ENTITY_EXIST(katana) then
          if Game.requestModel(0xE2BA016F) then
            katana = OBJECT.CREATE_OBJECT(0xE2BA016F, q_coords.x, q_coords.y, q_coords.z + 50, true, false, true)
            if ENTITY.DOES_ENTITY_EXIST(katana) then
              ENTITY.SET_ENTITY_COLLISION(katana, false, false)
              ENTITY.SET_ENTITY_ALPHA(pool_q, 0, false)
              ENTITY.SET_ENTITY_VISIBLE(pool_q, false, false)
              rpq:sleep(100)
              ENTITY.ATTACH_ENTITY_TO_ENTITY(katana, pool_q, 0, 0.0, 0.0, 0.025, 0.0, 0.0, 0.0, false, false, false,
                false,
                2, true, 0)
              q_replaced = true
            end
          end
        end
      else
        if q_replaced then
          if ENTITY.DOES_ENTITY_EXIST(katana) then
            ENTITY.DELETE_ENTITY(katana)
          end
          q_replaced = false
          katana     = 0
        end
      end
    else
      if q_replaced then
        if ENTITY.DOES_ENTITY_EXIST(katana) then
          ENTITY.DELETE_ENTITY(katana)
        end
        q_replaced = false
        katana     = 0
      end
    end
  end
end)
script.register_looped("laser_render", function(lsr)
  if laserSight and WEAPON.IS_PED_ARMED(self.get_ped(), 4) and Game.Self.isOnFoot() then
    local wpn_hash = WEAPON.GET_SELECTED_PED_WEAPON(self.get_ped())
    local wpn_idx  = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(self.get_ped(), 0)
    local h, m, s  = NETWORK.NETWORK_GET_GLOBAL_MULTIPLAYER_CLOCK(h, m, s)
    local laser_a  = 1.0
    local wpn_bone = 0
    if wpn_hash ~= 0x34A67B97 and wpn_hash ~= 0xBA536372 and wpn_hash ~= 0x184140A1 and wpn_hash ~= 0x060EC506 then
      for _, bone in ipairs(weapbones_T) do
        bone_check = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(wpn_idx, bone)
        if bone_check ~= -1 then
          wpn_bone = bone_check
          break
        end
      end
    end
    if h ~= nil then
      if h > 6 and h < 20 then
        laser_a = 0.5
      else
        laser_a = 0.2
      end
    else
      laser_a = 0.9
    end
    if PLAYER.IS_PLAYER_FREE_AIMING(self.get_id()) and wpn_bone ~= 0 then
      if Game.requestNamedPtfxAsset('core') then
        lsr:sleep(300)
        GRAPHICS.USE_PARTICLE_FX_ASSET('core')
        laserPtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE(laser_choice, wpn_idx,
          1.0, 0.0, -0.01, 0.0, 0.0, 90.0, wpn_bone, 0.20, false, false, false, 0, 0, 0, laser_a)
        GRAPHICS.SET_PARTICLE_FX_LOOPED_ALPHA(laserPtfx, laser_a)
        table.insert(laserPtfx_T, laserPtfx)
        drew_laser = true
      end
      if drew_laser then
        repeat
          lsr:sleep(50)
        until PLAYER.IS_PLAYER_FREE_AIMING(self.get_id()) == false
        for _, laser in ipairs(laserPtfx_T) do
          if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(laser) then
            GRAPHICS.STOP_PARTICLE_FX_LOOPED(laser, false)
            GRAPHICS.REMOVE_PARTICLE_FX(laser, false)
          end
          drew_laser = false
        end
      end
    end
  end
end)

-- vehicle stuff
script.register_looped("TDFT", function(script)
  script:yield()
  if PED.IS_PED_SITTING_IN_ANY_VEHICLE(self.get_ped()) then
    current_vehicle = onVehEnter(script)
    is_car          = VEHICLE.IS_THIS_MODEL_A_CAR(ENTITY.GET_ENTITY_MODEL(current_vehicle))
    is_quad         = VEHICLE.IS_THIS_MODEL_A_QUADBIKE(ENTITY.GET_ENTITY_MODEL(current_vehicle))
    is_plane        = VEHICLE.IS_THIS_MODEL_A_PLANE(ENTITY.GET_ENTITY_MODEL(current_vehicle))
    is_heli         = VEHICLE.IS_THIS_MODEL_A_HELI(ENTITY.GET_ENTITY_MODEL(current_vehicle))
    is_bike         = (VEHICLE.IS_THIS_MODEL_A_BIKE(ENTITY.GET_ENTITY_MODEL(current_vehicle))
      and VEHICLE.GET_VEHICLE_CLASS(current_vehicle) ~= 13 and ENTITY.GET_ENTITY_MODEL(current_vehicle) ~= 0x7B54A9D3)
    is_boat         = (VEHICLE.IS_THIS_MODEL_A_BOAT(ENTITY.GET_ENTITY_MODEL(current_vehicle)) or
      VEHICLE.IS_THIS_MODEL_A_JETSKI(ENTITY.GET_ENTITY_MODEL(current_vehicle)))
    if is_car or is_quad or is_bike then
      validModel = true
    else
      validModel = false
    end
    if validModel and DriftTires then
      if pressing_drift_button then
        if not drift_started then
          VEHICLE.SET_DRIFT_TYRES(current_vehicle, true)
          drift_started = true
        end
        VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, DriftPowerIncrease)
      else
        if drift_started then
          VEHICLE.SET_DRIFT_TYRES(current_vehicle, false)
          VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 1.0)
          drift_started = false
        end
      end
    end
    script:yield()
    if validModel and driftMode and not DriftTires then
      if pressing_drift_button then
        if not drift_started then
          VEHICLE.SET_VEHICLE_REDUCE_GRIP(current_vehicle, true)
          VEHICLE.SET_VEHICLE_REDUCE_GRIP_LEVEL(current_vehicle, DriftIntensity)
          drift_started = true
        end
        VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, DriftPowerIncrease)
      else
        if drift_started then
          VEHICLE.SET_VEHICLE_REDUCE_GRIP(current_vehicle, false)
          VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 1.0)
          drift_started = false
        end
      end
    end
    if speedBoost then
      if validModel or is_boat then
        if VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) then
          if pressing_nos_button and PAD.IS_CONTROL_PRESSED(0, 71) then
            VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, (nosPower) / 5)
            VEHICLE.MODIFY_VEHICLE_TOP_SPEED(current_vehicle, nosPower)
            if nosAudio then
              AUDIO.SET_VEHICLE_BOOST_ACTIVE(current_vehicle, true)
            end
            if nosvfx then
              GRAPHICS.ANIMPOSTFX_PLAY("DragRaceNitrous", 0, false)
            end
            using_nos = true
          end
        else
          if PED.IS_PED_SITTING_IN_ANY_VEHICLE(self.get_ped()) then
            if pressing_nos_button and PAD.IS_CONTROL_PRESSED(0, 71) then
              if VEHICLE.GET_VEHICLE_ENGINE_HEALTH(current_vehicle) < 300 then
                AUDIO.PLAY_SOUND_FROM_ENTITY(-1, "Engine_fail", current_vehicle,
                  "DLC_PILOT_ENGINE_FAILURE_SOUNDS", true, 0)
              end
            end
          end
        end
      end
      if using_nos and not pressing_nos_button then
        VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 1.0)
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(current_vehicle, -1)
        AUDIO.SET_VEHICLE_BOOST_ACTIVE(current_vehicle, false)
        if nosvfx then
          GRAPHICS.ANIMPOSTFX_PLAY("DragRaceNitrousOut", 0, false)
        end
        if GRAPHICS.ANIMPOSTFX_IS_RUNNING("DragRaceNitrous") then
          GRAPHICS.ANIMPOSTFX_STOP("DragRaceNitrous")
        end
        if GRAPHICS.ANIMPOSTFX_IS_RUNNING("DragRaceNitrousOut") then
          GRAPHICS.ANIMPOSTFX_STOP("DragRaceNitrousOut")
        end
        using_nos = false
      end
    end
    if hornLight and Game.Self.isDriving() then
      if not VEHICLE.GET_BOTH_VEHICLE_HEADLIGHTS_DAMAGED(current_vehicle) then
        if PAD.IS_CONTROL_PRESSED(0, 86) then
          VEHICLE.SET_VEHICLE_LIGHTS(current_vehicle, 2)
          VEHICLE.SET_VEHICLE_FULLBEAM(current_vehicle, true)
          repeat
            script:sleep(50)
          until
            PAD.IS_CONTROL_PRESSED(0, 86) == false
          VEHICLE.SET_VEHICLE_FULLBEAM(current_vehicle, false)
          VEHICLE.SET_VEHICLE_LIGHTS(current_vehicle, 0)
        end
      end
    end
    if Game.Self.isDriving() and is_car and keepWheelsTurned and not holdF and not ducking_in_car then
      if PAD.IS_DISABLED_CONTROL_PRESSED(0, 75) and (PAD.IS_CONTROL_PRESSED(0, 34) or PAD.IS_CONTROL_PRESSED(0, 35))
        and not HUD.IS_MP_TEXT_CHAT_TYPING() then
        VEHICLE.SET_VEHICLE_ENGINE_ON(current_vehicle, false, true, false)
        TASK.TASK_LEAVE_VEHICLE(self.get_ped(), current_vehicle, 16)
      end
    end
    if Game.Self.isDriving() and holdF then
      if PAD.IS_DISABLED_CONTROL_PRESSED(0, 75) and not HUD.IS_MP_TEXT_CHAT_TYPING() then
        timerB = timerB + 1
        if timerB >= 15 then
          if keepWheelsTurned and (PAD.IS_CONTROL_PRESSED(0, 34) or PAD.IS_CONTROL_PRESSED(0, 35)) and is_car and not ducking_in_car then
            VEHICLE.SET_VEHICLE_ENGINE_ON(current_vehicle, false, true, false)
            TASK.TASK_LEAVE_VEHICLE(self.get_ped(), current_vehicle, 16)
            timerB = 0
          else
            PED.SET_PED_CONFIG_FLAG(self.get_ped(), 241, false)
            TASK.TASK_LEAVE_VEHICLE(self.get_ped(), current_vehicle, 0)
            timerB = 0
          end
        end
      end
      if timerB >= 1 and timerB <= 10 then
        if PAD.IS_DISABLED_CONTROL_RELEASED(0, 75) and not HUD.IS_MP_TEXT_CHAT_TYPING() then
          if keepWheelsTurned and (PAD.IS_CONTROL_PRESSED(0, 34) or PAD.IS_CONTROL_PRESSED(0, 35)) and is_car and not ducking_in_car then
            TASK.TASK_LEAVE_VEHICLE(self.get_ped(), current_vehicle, 16)
            timerB = 0
          else
            PED.SET_PED_CONFIG_FLAG(self.get_ped(), 241, true)
            TASK.TASK_LEAVE_VEHICLE(self.get_ped(), current_vehicle, 0)
            timerB = 0
          end
        end
      end
    else
      if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 241, true) then
        PED.SET_PED_CONFIG_FLAG(self.get_ped(), 241, false)
      end
    end
  else
    if started_lct then
      started_lct = false
    end
    if started_popSound then
      started_popSound = false
    end
    if started_popSound2 then
      started_popSound2 = false
    end
    if current_vehicle ~= 0 then
      if not ENTITY.DOES_ENTITY_EXIST(current_vehicle) then
        current_vehicle = 0
      end
    end
  end
end)
script.register_looped("DSPTFX", function(dsptfx)
  if Game.Self.isDriving() then
    local dict = "scr_ba_bb"
    local wheels = { "wheel_lr", "wheel_rr" }
    if not VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) then
      if DriftSmoke and (driftMode or DriftTires) then
        local vehSpeedVec = ENTITY.GET_ENTITY_SPEED_VECTOR(current_vehicle, true)
        if (vehSpeedVec.x > 6 or vehSpeedVec.x < -6) and VEHICLE.IS_VEHICLE_ON_ALL_WHEELS(current_vehicle) then
          if is_car and pressing_drift_button and PAD.IS_CONTROL_PRESSED(0, 71) and VEHICLE.GET_VEHICLE_CURRENT_DRIVE_GEAR_(current_vehicle) > 0 and ENTITY.GET_ENTITY_SPEED(current_vehicle) > 6 then
            if Game.requestNamedPtfxAsset(dict) then
              if not has_custom_tires then
                VEHICLE.TOGGLE_VEHICLE_MOD(current_vehicle, 20, true)
              end
              VEHICLE.SET_VEHICLE_TYRE_SMOKE_COLOR(current_vehicle, driftSmoke_T.r, driftSmoke_T.g, driftSmoke_T.b)
              for _, boneName in ipairs(wheels) do
                local r_wheels = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, boneName)
                GRAPHICS.USE_PARTICLE_FX_ASSET(dict)
                smokePtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("scr_ba_bb_plane_smoke_trail",
                  current_vehicle,
                  -0.4, 0.0, 0.0, 0.0, 0.0, 0.0, r_wheels, 0.3, false, false, false, 0, 0, 0, 255)
                GRAPHICS.SET_PARTICLE_FX_LOOPED_COLOUR(smokePtfx, driftSmoke_T.r, driftSmoke_T.g, driftSmoke_T.b, false)
                table.insert(smokePtfx_t, smokePtfx)
                GRAPHICS.STOP_PARTICLE_FX_LOOPED(smoke, false)
                tire_smoke = true
              end
              if tire_smoke then
                repeat
                  dsptfx:sleep(50)
                until
                  not pressing_drift_button or PAD.IS_CONTROL_RELEASED(0, 71)
                for _, smoke in ipairs(smokePtfx_t) do
                  if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(smoke) then
                    GRAPHICS.STOP_PARTICLE_FX_LOOPED(smoke, false)
                    GRAPHICS.REMOVE_PARTICLE_FX(smoke, false)
                  end
                end
                tire_smoke = false
              end
            end
          end
        end
      end
    else
      if BurnoutSmoke and not launchCtrl then
        if VEHICLE.IS_VEHICLE_IN_BURNOUT(current_vehicle) then
          dsptfx:sleep(1000)
          if Game.requestNamedPtfxAsset(dict) then
            if not has_custom_tires then
              VEHICLE.TOGGLE_VEHICLE_MOD(current_vehicle, 20, true)
            end
            VEHICLE.SET_VEHICLE_TYRE_SMOKE_COLOR(current_vehicle, driftSmoke_T.r, driftSmoke_T.g, driftSmoke_T.b)
            for _, boneName in ipairs(wheels) do
              local r_wheels = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, boneName)
              GRAPHICS.USE_PARTICLE_FX_ASSET(dict)
              smokePtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("scr_ba_bb_plane_smoke_trail",
                current_vehicle,
                -0.4, 0.0, 0.0, 0.0, 0.0, 90.0, r_wheels, 0.2, false, false, false, 0, 0, 0, 255)
              GRAPHICS.SET_PARTICLE_FX_LOOPED_COLOUR(smokePtfx, driftSmoke_T.r, driftSmoke_T.g, driftSmoke_T.b, false)
              table.insert(smokePtfx_t, smokePtfx)
              GRAPHICS.STOP_PARTICLE_FX_LOOPED(smoke, false)
              tire_smoke = true
            end
            if tire_smoke then
              repeat
                dsptfx:sleep(50)
              until
                VEHICLE.IS_VEHICLE_IN_BURNOUT(current_vehicle) == false
              for _, smoke in ipairs(smokePtfx_t) do
                if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(smoke) then
                  GRAPHICS.STOP_PARTICLE_FX_LOOPED(smoke, false)
                  GRAPHICS.REMOVE_PARTICLE_FX(smoke, false)
                end
              end
              tire_smoke = false
            end
          end
        end
      end
    end
  end
end)
script.register_looped("LCTRL", function(lct)
  if launchCtrl and Game.Self.isDriving() then
    if limitVehOptions then
      if VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 4 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 6 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 7 then
        lct:yield()
        return
      end
    end
    local notif_sound, notif_ref
    if Game.isOnline() then
      notif_sound, notif_ref = "SELL", "GTAO_EXEC_SECUROSERV_COMPUTER_SOUNDS"
    else
      notif_sound, notif_ref = "MP_5_SECOND_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET"
    end
    if validModel or is_bike or is_quad then
      if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) and VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) and VEHICLE.GET_VEHICLE_ENGINE_HEALTH(current_vehicle) > 300 then
        if PAD.IS_CONTROL_PRESSED(0, 71) and PAD.IS_CONTROL_PRESSED(0, 72) and not pressing_drift_button then
          started_lct = true
          ENTITY.FREEZE_ENTITY_POSITION(current_vehicle, true)
          timerA = timerA + 1
          if timerA >= 100 then
            gui.show_success("Samurais Scripts", "Launch Control Activated!")
            AUDIO.PLAY_SOUND_FRONTEND(-1, notif_sound, notif_ref, true)
            repeat
              lct:sleep(100)
            until PAD.IS_CONTROL_RELEASED(0, 72)
            launch_active = true
          end
        elseif started_lct and timerA > 0 and timerA < 150 then
          if PAD.IS_CONTROL_RELEASED(0, 71) or PAD.IS_CONTROL_RELEASED(0, 72) then
            timerA = 0
            ENTITY.FREEZE_ENTITY_POSITION(current_vehicle, false)
            started_lct = false
          end
        end
      end
      if launch_active then
        if PAD.IS_CONTROL_PRESSED(0, 71) and PAD.IS_CONTROL_RELEASED(0, 72) then
          PHYSICS.SET_IN_ARENA_MODE(true)
          VEHICLE.SET_VEHICLE_MAX_LAUNCH_ENGINE_REVS_(current_vehicle, -1)
          VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 10)
          VEHICLE.MODIFY_VEHICLE_TOP_SPEED(current_vehicle, 100.0)
          ENTITY.FREEZE_ENTITY_POSITION(current_vehicle, false)
          VEHICLE.SET_VEHICLE_FORWARD_SPEED(current_vehicle, 9.3)
          lct:sleep(4269)
          VEHICLE.MODIFY_VEHICLE_TOP_SPEED(current_vehicle, -1)
          VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(current_vehicle, 1.0)
          VEHICLE.SET_VEHICLE_MAX_LAUNCH_ENGINE_REVS_(current_vehicle, 1.0)
          PHYSICS.SET_IN_ARENA_MODE(false)
          launch_active = false
          timerA = 0
        end
      end
    end
  end
  lct:yield()
end)
script.register_looped("MISC Vehicle Options", function(mvo)
  if Game.Self.isDriving() then
    if autobrklight then
      if VEHICLE.IS_VEHICLE_DRIVEABLE(current_vehicle, false) and VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) and VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) then
        VEHICLE.SET_VEHICLE_BRAKE_LIGHTS(current_vehicle, true)
      end
    end

    if insta180 then
      local vehRot = ENTITY.GET_ENTITY_ROTATION(current_vehicle, 2)
      if PAD.IS_CONTROL_JUST_PRESSED(0, 97) then -- numpad + // mouse scroll down
        if PAD.IS_CONTROL_PRESSED(0, 71) then
          local vehSpeed = ENTITY.GET_ENTITY_SPEED(current_vehicle)
          ENTITY.SET_ENTITY_ROTATION(current_vehicle, vehRot.x, vehRot.y, (vehRot.z - 180), 2, true)
          VEHICLE.SET_VEHICLE_FORWARD_SPEED(current_vehicle, vehSpeed)
        else
          ENTITY.SET_ENTITY_ROTATION(current_vehicle, vehRot.x, vehRot.y, (vehRot.z - 180), 2, true)
          if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) then
            VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(current_vehicle, 5.0)
          end
        end
      end
    end
  end

  if flappyDoors and current_vehicle ~= 0 and not is_bike and not is_boat then
    local n_doors = VEHICLE.GET_NUMBER_OF_VEHICLE_DOORS(current_vehicle)
    if n_doors > 0 then
      for i = -1, n_doors + 1 do
        if VEHICLE.GET_IS_DOOR_VALID(current_vehicle, i) then
          mvo:sleep(180)
          VEHICLE.SET_VEHICLE_DOOR_OPEN(current_vehicle, i, false, false)
          mvo:sleep(180)
          VEHICLE.SET_VEHICLE_DOOR_SHUT(current_vehicle, i, false)
        end
      end
    end
  end

  if loud_radio then
    if current_vehicle ~= nil and current_vehicle ~= 0 then
      if not loud_radio_enabled then
        AUDIO.SET_VEHICLE_RADIO_LOUD(current_vehicle, true)
        loud_radio_enabled = true
      end
    else
      if loud_radio_enabled then
        loud_radio_enabled = false
      end
    end
  end
end)
script.register_looped("NOS ptfx", function(spbptfx)
  spbptfx:yield()
  if nosFlames then
    if speedBoost and Game.Self.isDriving() then
      if validModel or is_boat or is_bike then
        if pressing_nos_button and PAD.IS_CONTROL_PRESSED(0, 71) then
          if VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) then
            local effect  = "veh_xs_vehicle_mods"
            local counter = 0
            while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(effect) do
              STREAMING.REQUEST_NAMED_PTFX_ASSET(effect)
              spbptfx:yield()
              if counter > 100 then
                return
              else
                counter = counter + 1
              end
            end
            local exhaustCount = VEHICLE.GET_VEHICLE_MAX_EXHAUST_BONE_COUNT_() - 1
            for i = 0, exhaustCount do
              local retBool, boneIndex = VEHICLE.GET_VEHICLE_EXHAUST_BONE_(current_vehicle, i, retBool, boneIndex)
              if retBool then
                GRAPHICS.USE_PARTICLE_FX_ASSET(effect)
                nosPtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("veh_nitrous", current_vehicle, 0.0,
                  0.0, 0.0, 0.0, 0.0, 0.0, boneIndex, 1.0, false, false, false, 0, 0, 0, 255)
                table.insert(nosptfx_t, nosPtfx)
                nos_started = true
              end
            end
            if nos_started then
              repeat
                spbptfx:sleep(50)
              until
                not pressing_nos_button or PAD.IS_CONTROL_RELEASED(0, 71)
              for _, nos in ipairs(nosptfx_t) do
                if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(nos) then
                  GRAPHICS.STOP_PARTICLE_FX_LOOPED(nos, false)
                  GRAPHICS.REMOVE_PARTICLE_FX(nos, false)
                  nos_started = false
                end
              end
            end
          end
        end
      end
    end
  end
end)
script.register_looped("2-step", function(twostep)
  if launchCtrl and Game.Self.isDriving() then
    if limitVehOptions then
      if VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 4 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 6 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 7 then
        twostep:yield()
        return
      end
    end
    if validModel or is_bike or is_quad then
      if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) and VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) and VEHICLE.GET_VEHICLE_ENGINE_HEALTH(current_vehicle) >= 300 then
        if PAD.IS_CONTROL_PRESSED(0, 71) and PAD.IS_CONTROL_PRESSED(0, 72) and not pressing_drift_button then
          local asset   = "core"
          local counter = 0
          while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(asset) do
            STREAMING.REQUEST_NAMED_PTFX_ASSET(asset)
            twostep:yield()
            if counter > 100 then
              return
            else
              counter = counter + 1
            end
          end
          local exhaustCount = VEHICLE.GET_VEHICLE_MAX_EXHAUST_BONE_COUNT_() - 1
          for i = 0, exhaustCount do
            local retBool, boneIndex = VEHICLE.GET_VEHICLE_EXHAUST_BONE_(current_vehicle, i, retBool, boneIndex)
            if retBool then
              GRAPHICS.USE_PARTICLE_FX_ASSET(asset)
              lctPtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("veh_backfire", current_vehicle, 0.0,
                0.0, 0.0, 0.0, 0.0, 0.0, boneIndex, 0.69420, false, false, false, 0, 0, 0, 255)
              table.insert(lctPtfx_t, lctPtfx)
              twostep_started = true
            end
          end
          if twostep_started then
            repeat
              twostep:sleep(50)
            until PAD.IS_CONTROL_RELEASED(0, 72) or launch_active == false
            for _, bfire in ipairs(lctPtfx_t) do
              if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(bfire) then
                GRAPHICS.STOP_PARTICLE_FX_LOOPED(bfire, false)
                GRAPHICS.REMOVE_PARTICLE_FX(bfire, false)
              end
            end
            twostep_started = false
          end
        end
      end
    end
  end
end)
script.register_looped("LCTRL SFX", function(tstp)
  if Game.Self.isDriving() then
    if limitVehOptions then
      if VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 4 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 6 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 7 then
        tstp:yield()
        return
      end
    end
    if launchCtrl then
      if lctPtfx_t[1] ~= nil then
        local popSound
        if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) and PAD.IS_CONTROL_PRESSED(0, 71) and PAD.IS_CONTROL_PRESSED(0, 72) and not pressing_drift_button then
          for _, p in ipairs(lctPtfx_t) do
            if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(p) then
              local randStime = math.random(60, 120)
              popSound = AUDIO.PLAY_SOUND_FROM_ENTITY(-1, "BOOT_POP", current_vehicle, "DLC_VW_BODY_DISPOSAL_SOUNDS",
                true, 0)
              AUDIO.SET_AUDIO_SPECIAL_EFFECT_MODE(1)
              table.insert(popSounds_t, popSound)
              tstp:sleep(randStime)
              started_popSound = true
            end
          end
        end
        if started_popSound then
          if PAD.IS_CONTROL_RELEASED(0, 71) or PAD.IS_CONTROL_RELEASED(0, 72) then
            for _, s in ipairs(popSounds_t) do
              AUDIO.STOP_SOUND(s)
            end
          end
        end
      end
    end
    if popsNbangs then
      if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) then
        rpmThreshold = 0.45
      elseif noEngineBraking then
        rpmThreshold = 0.80
      else
        rpmThreshold = 0.69
      end
      if not louderPops then
        popsnd, sndRef = "BOOT_POP", "DLC_VW_BODY_DISPOSAL_SOUNDS"
        flame_size = 0.42069
      else
        popsnd, sndRef = "SNIPER_FIRE", "DLC_BIKER_RESUPPLY_MEET_CONTACT_SOUNDS"
        flame_size = 1.5
      end
      local currRPM  = VEHICLE.GET_VEHICLE_CURRENT_REV_RATIO_(current_vehicle)
      local currGear = VEHICLE.GET_VEHICLE_CURRENT_DRIVE_GEAR_(current_vehicle)
      if PAD.IS_CONTROL_RELEASED(0, 71) and currRPM < 1.0 and currRPM > rpmThreshold and currGear ~= 0 then
        local popSound2
        local randStime = math.random(60, 200)
        popSound2 = AUDIO.PLAY_SOUND_FROM_ENTITY(-1, popsnd, current_vehicle, sndRef, true, 0)
        table.insert(popSounds_t, popSound2)
        tstp:sleep(randStime)
        started_popSound2 = true
      end
      if started_popSound2 then
        currRPM = VEHICLE.GET_VEHICLE_CURRENT_REV_RATIO_(current_vehicle)
        if PAD.IS_CONTROL_PRESSED(0, 71) or currRPM < rpmThreshold then
          for _, s in ipairs(popSounds_t) do
            AUDIO.STOP_SOUND(s)
          end
          started_popSound2 = false
        end
      end
    end
  else
    tstp:yield()
  end
end)
script.register_looped("pops&bangs", function(pnb)
  if Game.Self.isDriving() and VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) then
    if is_car or is_bike or is_quad then
      if popsNbangs then
        if limitVehOptions then
          if VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 4 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 6 and VEHICLE.GET_VEHICLE_CLASS(self.get_veh()) ~= 7 then
            pnb:yield()
            return
          end
        end
        AUDIO.ENABLE_VEHICLE_EXHAUST_POPS(current_vehicle, false)
        default_pops_disabled = true
        local counter         = 0
        local asset           = "core"
        local currRPM         = VEHICLE.GET_VEHICLE_CURRENT_REV_RATIO_(current_vehicle)
        local currGear        = VEHICLE.GET_VEHICLE_CURRENT_DRIVE_GEAR_(current_vehicle)
        if VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) then
          rpmThreshold = 0.45
        elseif noEngineBraking then
          rpmThreshold = 0.80
        else
          rpmThreshold = 0.69
        end
        while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(asset) do
          STREAMING.REQUEST_NAMED_PTFX_ASSET(asset)
          pnb:yield()
          if counter > 100 then
            return
          else
            counter = counter + 1
          end
        end
        if PAD.IS_CONTROL_RELEASED(0, 71) and currRPM < 1.0 and currRPM > rpmThreshold and currGear ~= 0 then
          local exhaustCount = VEHICLE.GET_VEHICLE_MAX_EXHAUST_BONE_COUNT_() - 1
          for i = 0, exhaustCount do
            local retBool, boneIndex = VEHICLE.GET_VEHICLE_EXHAUST_BONE_(current_vehicle, i, retBool, boneIndex)
            if retBool then
              currRPM = VEHICLE.GET_VEHICLE_CURRENT_REV_RATIO_(current_vehicle)
              if currRPM < 1.0 and currRPM > 0.55 then
                GRAPHICS.USE_PARTICLE_FX_ASSET(asset)
                popsPtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("veh_backfire", current_vehicle,
                  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, boneIndex, flame_size, false, false, false, 0, 0, 0, 255)
                GRAPHICS.STOP_PARTICLE_FX_LOOPED(popsPtfx, false)
                table.insert(popsPtfx_t, popsPtfx)
                started_popSound2 = true
              end
            end
          end
        end
        if started_popSound2 then
          currRPM = VEHICLE.GET_VEHICLE_CURRENT_REV_RATIO_(current_vehicle)
          if PAD.IS_CONTROL_PRESSED(0, 71) or currRPM < rpmThreshold then
            for _, bfire in ipairs(popsPtfx_t) do
              if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(bfire) then
                GRAPHICS.STOP_PARTICLE_FX_LOOPED(bfire, false)
                GRAPHICS.REMOVE_PARTICLE_FX(bfire, false)
              end
            end
            for _, s in ipairs(popSounds_t) do
              AUDIO.STOP_SOUND(s)
            end
            started_popSound2 = false
          end
        end
      else
        if default_pops_disabled then
          AUDIO.ENABLE_VEHICLE_EXHAUST_POPS(current_vehicle, true)
          default_pops_disabled = false
        end
      end
    end
  else
    pnb:yield()
  end
end)
script.register_looped("PBSE", function(pnbse)
  if started_popSound2 and louderPops then
    local myPos = self.get_pos()
    if not EVENT.IS_SHOCKING_EVENT_IN_SPHERE(79, myPos.x, myPos.y, myPos.z, 50) then
      loud_pops_event = EVENT.ADD_SHOCKING_EVENT_FOR_ENTITY(79, current_vehicle, 10.0)
      repeat
        pnbse:sleep(10)
      until started_popSound2 == false
      EVENT.REMOVE_SHOCKING_EVENT(loud_pops_event)
    end
  end
end)
-- vehicle mines
script.register_looped("VEHMNS", function(vmns)
  if Game.Self.isDriving() then
    if veh_mines and current_vehicle ~= 0 and (is_car or is_bike or is_quad) then
      local bone_n = "chassis_dummy"
      local mine_hash
      if vmine_type.spikes then
        mine_hash = -647126932
      elseif vmine_type.slick then
        mine_hash = 1459276487
      elseif vmine_type.explosive then
        mine_hash = 1508567460
      elseif vmine_type.emp then
        mine_hash = 1776356704
      elseif vmine_type.kinetic then
        mine_hash = 1007245390
      else
        mine_hash = -647126932 -- default to spikes if nothing else was selected.
      end
      local bone_idx = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(self.get_veh(), bone_n)
      if pressing_vmine_button then
        if Game.requestWeaponAsset(mine_hash) then
          if bone_idx ~= -1 then
            local bone_pos    = ENTITY.GET_ENTITY_BONE_POSTION(self.get_veh(), bone_idx)
            local veh_pos     = ENTITY.GET_ENTITY_COORDS(self.get_veh(), true)
            local veh_fwd     = ENTITY.GET_ENTITY_FORWARD_VECTOR(self.get_veh())
            local veh_hash    = ENTITY.GET_ENTITY_MODEL(self.get_veh())
            local vmin, vmax  = Game.getModelDimensions(veh_hash, vmns)
            local veh_len     = vmax.y - vmin.y
            local _, ground_z = MISC.GET_GROUND_Z_FOR_3D_COORD(veh_pos.x, veh_pos.y, veh_pos.z, ground_z, false, false)
            local x_offset    = veh_fwd.x * (veh_len / 1.6)
            local y_offset    = veh_fwd.y * (veh_len / 1.6)
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(
              bone_pos.x - x_offset, bone_pos.y - y_offset, bone_pos.z,
              bone_pos.x - x_offset, bone_pos.y - y_offset, ground_z,
              0.0, false, mine_hash, self.get_ped(), true, false, 0.01
            )
          end
        end
        vmns:sleep(969)
      end
    end
  end
end)
-- drift minigame (WIP)
script.register_looped("straight line counter", function()
  if (driftMode or DriftTires) and driftMinigame and is_car then
    if Game.Self.isDriving() and is_drifting and driftMinigame then
      local vehSpeedVec = ENTITY.GET_ENTITY_SPEED_VECTOR(current_vehicle, true)
      if not VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) then
        if vehSpeedVec.x ~= 0 and vehSpeedVec.x < 2 or vehSpeedVec.x > -2 then
          straight_counter = straight_counter + 1
        else
          straight_counter = 0
        end
      end
    end
  end
end)
script.register_looped("drift counter", function(dcounter)
  if driftMinigame then
    if (driftMode or DriftTires) and is_car then
      if Game.Self.isDriving() then
        local vehSpeedVec = ENTITY.GET_ENTITY_SPEED_VECTOR(current_vehicle, true)
        if vehSpeedVec.x ~= 0 and VEHICLE.IS_VEHICLE_ON_ALL_WHEELS(current_vehicle) then
          if vehSpeedVec.x > 6 or vehSpeedVec.x < -6 then
            is_drifting       = true
            drift_streak_text = 'Drift' .. '   x' .. drift_multiplier
            straight_counter  = 0
            drift_points      = drift_points + (1 * drift_multiplier)
          end
          if vehSpeedVec.x > 11 or vehSpeedVec.x < -11 then
            is_drifting       = true
            drift_streak_text = 'Big Angle!' .. '   x' .. drift_multiplier
            straight_counter  = 0
            drift_points      = drift_points + (5 * drift_multiplier)
          end
          if vehSpeedVec.x > 14 or vehSpeedVec.x < -14 then
            is_drifting       = true
            drift_streak_text = 'SICK ANGLE!!!' .. '   x' .. drift_multiplier
            straight_counter  = 0
            drift_points      = drift_points + (10 * drift_multiplier)
          end
        end
        if is_drifting then
          if not VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) then
            if vehSpeedVec.x < 2 and vehSpeedVec.x > -2 then
              if straight_counter > 400 then
                if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(current_vehicle) then
                  if checkDriftCollision() then
                    drift_streak_text = 'Streak lost!'
                    drift_points      = 0
                    drift_multiplier  = 1
                    drift_extra_pts   = 0
                    is_drifting       = false
                  end
                else
                  drift_streak_text = 'Banked Points: '
                  if not Game.isOnline() then
                    if drift_points > 100 then
                      bankDriftPoints_SP(lua_Fn.round((drift_points / 10), 0))
                    end
                  end
                  if drift_points > driftPB then
                    lua_cfg.save("driftPB", drift_points)
                    driftPB = lua_cfg.read("driftPB")
                  end
                  dcounter:sleep(3000)
                  drift_points     = 0
                  drift_extra_pts  = 0
                  drift_multiplier = 1
                  is_drifting      = false
                end
              end
            end
          end
          if not VEHICLE.IS_VEHICLE_STOPPED(current_vehicle) then
            if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(current_vehicle) then
              if checkDriftCollision() then
                drift_streak_text = 'Streak Lost!'
                drift_points      = 0
                drift_extra_pts   = 0
                drift_multiplier  = 1
                dcounter:sleep(3000)
                is_drifting = false
              end
            end
          else
            dcounter:sleep(3000)
            if not ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(current_vehicle) then
              drift_streak_text = 'Banked Points: '
              if not Game.isOnline() then
                if drift_points > 100 then
                  bankDriftPoints_SP(lua_Fn.round((drift_points / 10), 0))
                end
              end
              if drift_points > driftPB then
                lua_cfg.save("driftPB", drift_points)
                driftPB = lua_cfg.read("driftPB")
              end
              dcounter:sleep(3000)
              drift_points     = 0
              drift_multiplier = 1
              is_drifting      = false
            else
              if checkDriftCollision() then
                drift_streak_text = 'Streak Lost!'
                drift_points      = 0
                drift_extra_pts   = 0
                drift_multiplier  = 1
                is_drifting       = false
                dcounter:sleep(3000)
              end
            end
          end
        end
      else
        if is_drifting then
          drift_streak_text = 'Streak Lost!'
          drift_points      = 0
          drift_extra_pts   = 0
          drift_multiplier  = 1
          is_drifting       = false
        end
      end
    end
  end
end)
script.register_looped("drift time counter", function(dtcounter)
  if Game.Self.isDriving and is_car and driftMinigame and is_drifting then
    if straight_counter == 0 then
      drift_time = drift_time + 1
      dtcounter:sleep(1000)
    end
  else
    if drift_time > 0 then -- no need to keep setting it to 0
      drift_time = 0
    end
  end
end)
script.register_looped("extra points checker", function(epc)
  if Game.Self.isDriving and is_car and driftMinigame then
    if is_drifting and ENTITY.GET_ENTITY_SPEED(current_vehicle) > 7 then
      if not ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(current_vehicle) then
        local vehicle_height = ENTITY.GET_ENTITY_HEIGHT_ABOVE_GROUND(current_vehicle)
        if vehicle_height > 0.8 and not VEHICLE.IS_VEHICLE_ON_ALL_WHEELS(current_vehicle) then
          if vehicle_height >= 1.1 and vehicle_height <= 5 and not lua_Fn.str_contains(drift_extra_text, "Big Air!") then
            drift_extra_pts  = drift_extra_pts + 1
            drift_points     = drift_points + drift_extra_pts
            drift_extra_text = "Air  +" .. drift_extra_pts .. " pts"
            epc:sleep(100)
          elseif vehicle_height > 5 then
            drift_extra_pts  = drift_extra_pts + 5
            drift_points     = drift_points + drift_extra_pts
            drift_extra_text = "Big Air!  +" .. drift_extra_pts .. " pts"
            epc:sleep(100)
          end
        else
          if drift_extra_pts > 0 then
            epc:sleep(2000)
            drift_extra_pts = 0
            drift_extra_text = ""
          end
        end
      else
        local bool, txt = checkDriftCollision()
        if not bool and drift_streak_text ~= "" then
          drift_extra_pts  = drift_extra_pts + 1
          drift_points     = drift_points + drift_extra_pts
          drift_extra_text = txt .. "  +" .. drift_extra_pts .. " pts"
        else
          drift_extra_text = txt
          epc:sleep(3000)
          if drift_extra_pts > 0 or drift_extra_text ~= "" then
            drift_extra_pts  = 0
            drift_extra_text = ""
          end
        end
      end
    else
      if drift_extra_pts > 0 then
        epc:sleep(2000)
        drift_extra_pts = 0
        drift_extra_text = ""
      end
    end
  else
    if drift_extra_pts > 0 then
      epc:sleep(2000)
      drift_extra_pts = 0
      drift_extra_text = ""
    end
  end
end)
script.register_looped("drift multiplier", function(dmult)
  if Game.Self.isDriving and is_car and driftMinigame and is_drifting then
    if drift_time >= 10 and drift_time < 30 then
      drift_multiplier = 1
    elseif drift_time >= 20 and drift_time < 60 then
      drift_multiplier = 2
    elseif drift_time >= 60 and drift_time < 120 then
      drift_multiplier = 5
    elseif drift_time >= 120 then
      drift_multiplier = 10
    end
  else
    if drift_multiplier > 1 then
      drift_multiplier = 1
    end
  end
  dmult:yield()
end)
script.register_looped("drift points", function()
  if Game.Self.isDriving() and is_car and driftMinigame and is_drifting then
    showDriftCounter(drift_streak_text .. "\n+" .. lua_Fn.separateInt(drift_points) .. " pts")
    if drift_extra_pts > 0 or drift_extra_text ~= "" then
      showDriftExtra(drift_extra_text)
    end
  end
end)
-- Missile defense
script.register_looped("missile defense", function(md)
  if missiledefense and current_vehicle ~= 0 then
    local missile
    local vehPos  = ENTITY.GET_ENTITY_COORDS(current_vehicle, true)
    local selfPos = self.get_pos()
    for _, p in pairs(projectile_types_T) do
      if MISC.IS_PROJECTILE_TYPE_IN_AREA(vehPos.x + 500, vehPos.y + 500, vehPos.z + 100, vehPos.x - 500, vehPos.y - 500, vehPos.z - 100, p, false) then
        missile = p
        break
      end
    end
    if missile ~= nil and missile ~= 0 then
      --[[
      if MISC.IS_PROJECTILE_TYPE_IN_AREA(vehPos.x + 100, vehPos.y + 100, vehPos.z + 100, vehPos.x - 100, vehPos.y - 100, vehPos.z - 100, missile, false) then
        if Game.Self.isDriving() and (is_plane or is_heli) then
          shoot_flares(md)
        end
      end
      ^ auto-counters missiles with flares but it's too easy in dogfights and also I couldn't find
      a way to determine if a missile was coming towards us or if it was fired by us... I'm such a noob!
    ]]
      if MISC.IS_PROJECTILE_TYPE_IN_AREA(vehPos.x + 20, vehPos.y + 20, vehPos.z + 100, vehPos.x - 20, vehPos.y - 20, vehPos.z - 100, missile, false) then
        if not MISC.IS_PROJECTILE_TYPE_IN_AREA(vehPos.x + 10, vehPos.y + 10, vehPos.z + 50, vehPos.x - 10, vehPos.y - 10, vehPos.z - 50, missile, false) and not MISC.IS_PROJECTILE_TYPE_IN_AREA(selfPos.x + 10, selfPos.y + 10, selfPos.z + 50, selfPos.x - 10, selfPos.y - 10, selfPos.z - 50, missile, false) then
          if not disable_mdef_logs then
            log.info('Detected projectile within our defense area! Proceeding to destroy it.')
          end
          WEAPON.REMOVE_ALL_PROJECTILES_OF_TYPE(missile, true)
          if Game.requestNamedPtfxAsset("scr_sm_counter") then
            GRAPHICS.USE_PARTICLE_FX_ASSET("scr_sm_counter")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD("scr_sm_counter_chaff", vehPos.x, vehPos.y,
              (vehPos.z + 2.5),
              0.0, 0.0, 0.0, 5.0, false, false, false, false)
          end
        else
          if not disable_mdef_logs then
            log.warning('Found a projectile very close to our vehicle! Proceeding to remove it.')
          end
          WEAPON.REMOVE_ALL_PROJECTILES_OF_TYPE(missile, false)
          if Game.requestNamedPtfxAsset("scr_sm_counter") then
            GRAPHICS.USE_PARTICLE_FX_ASSET("scr_sm_counter")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD("scr_sm_counter_chaff", vehPos.x, vehPos.y,
              (vehPos.z + 2.5),
              0.0, 0.0, 0.0, 5.0, false, false, false, false)
          end
        end
      end
    end
    md:yield()
  end
end)
script.register_looped("Purge", function(nosprg)
  if Game.Self.isDriving() then
    if nosPurge and validModel or nosPurge and is_bike then
      if pressing_purge_button and not is_in_flatbed then
        local dict       = "core"
        local purgeBones = { "suspension_lf", "suspension_rf" }
        if not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(dict) then
          STREAMING.REQUEST_NAMED_PTFX_ASSET(dict)
          coroutine.yield()
        end
        for _, boneName in ipairs(purgeBones) do
          local purge_exit = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, boneName)
          if boneName == "suspension_lf" then
            purge_rotZ = -180.0
            purge_posX = -0.3
          else
            purge_rotZ = 0.0
            purge_posX = 0.3
          end
          GRAPHICS.USE_PARTICLE_FX_ASSET(dict)
          purgePtfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("weap_extinguisher", current_vehicle,
            purge_posX, -0.33, 0.2, 0.0, -17.5, purge_rotZ, purge_exit, 0.4, false, false, false, 0, 0, 0, 255)
          table.insert(purgePtfx_t, purgePtfx)
          purge_started = true
        end
        if purge_started then
          repeat
            nosprg:sleep(50)
          until
            not pressing_purge_button
          for _, purge in ipairs(purgePtfx_t) do
            if GRAPHICS.DOES_PARTICLE_FX_LOOPED_EXIST(purge) then
              GRAPHICS.STOP_PARTICLE_FX_LOOPED(purge, false)
              GRAPHICS.REMOVE_PARTICLE_FX(purge, false)
              purge_started = false
            end
          end
        end
      end
    end
  else
    nosprg:yield()
  end
end)
script.register_looped("rgbLights", function(rgb)
  if start_rgb_loop then
    for i = 0, 14 do
      if start_rgb_loop and not VEHICLE.GET_BOTH_VEHICLE_HEADLIGHTS_DAMAGED(current_vehicle) then
        if not has_xenon then
          VEHICLE.TOGGLE_VEHICLE_MOD(current_vehicle, 22, true)
        end
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.9)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.8)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.7)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.6)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.5)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle, i)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.4)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.3)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.2)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.1)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle, i)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.2)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.3)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.4)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.5)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle, i)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.6)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.7)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.8)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 0.9)
        rgb:sleep(100 / lightSpeed)
        VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 1.0)
        VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle, i)
        rgb:sleep(100 / lightSpeed)
      else
        if has_xenon then
          VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 1.0)
          VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(current_vehicle, defaultXenon)
          break
        else
          VEHICLE.SET_VEHICLE_LIGHT_MULTIPLIER(current_vehicle, 1.0)
          VEHICLE.TOGGLE_VEHICLE_MOD(current_vehicle, 22, false)
          break
        end
      end
    end
  else
    rgb:yield()
  end
end)
script.register_looped("no jacking", function(ctt)
  if noJacking then
    if not PED.GET_PED_CONFIG_FLAG(self.get_ped(), 398, true) then
      PED.SET_PED_CAN_BE_DRAGGED_OUT(self.get_ped(), false)
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 398, true)
    end
    if not PED.GET_PED_CONFIG_FLAG(self.get_ped(), 177, true) then
      PED.SET_PED_CAN_BE_DRAGGED_OUT(self.get_ped(), false)
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 177, true)
    end
  else
    if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 398, true) then
      PED.SET_PED_CAN_BE_DRAGGED_OUT(self.get_ped(), true)
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 398, false)
    end
    if PED.GET_PED_CONFIG_FLAG(self.get_ped(), 177, true) then
      PED.SET_PED_CAN_BE_DRAGGED_OUT(self.get_ped(), true)
      PED.SET_PED_CONFIG_FLAG(self.get_ped(), 177, false)
    end
  end
  ctt:yield()
end)

-- Planes & Helis
script.register_looped("Unlimited Flares", function(flrs)
  flrs:yield()
  if flares_forall then
    if Game.Self.isDriving() and (is_plane or is_heli) then
      if PAD.IS_CONTROL_PRESSED(0, 356) and VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(current_vehicle) and Game.isOnline() then
        shoot_flares(flrs)
        flrs:sleep(3000)
      end
    end
  end
end)
script.register_looped("Real Jet Speed", function(rjspd)
  rjspd:yield()
  if real_plane_speed then
    if Game.Self.isDriving() and is_plane then
      local jet_increase
      local current_speed = ENTITY.GET_ENTITY_SPEED(current_vehicle)
      local jet_rotation  = ENTITY.GET_ENTITY_ROTATION(current_vehicle, 2)
      if jet_rotation.x >= 30 then
        jet_increase = 0.4
      elseif jet_rotation.x >= 60 then
        jet_increase = 0.8
      else
        jet_increase = 0.21
      end
      -- wait for the plane to go over the low altitude speed limit then start increasing its top speed and don't go over 500km/h
      -- (555km/h is fast and safe. Higher speeds break the game)
      if current_speed >= 73 and current_speed < 154.1666 then
        if PAD.IS_CONTROL_PRESSED(0, 87) and VEHICLE.GET_LANDING_GEAR_STATE(current_vehicle) == 4 then
          VEHICLE.SET_VEHICLE_FORWARD_SPEED(current_vehicle, (current_speed + jet_increase))
        end
      end
    end
  end
end)
script.register_looped("UBWIN", function()
  if unbreakableWindows and current_vehicle ~= nil and current_vehicle ~= 0 then
    if not ubwindowsToggled then
      VEHICLE.SET_DONT_PROCESS_VEHICLE_GLASS(current_vehicle, true)
      ubwindowsToggled = true
    end
  end
end)
script.register_looped("Auto-Pilot Keyboard Interrupt", function(apki)
  if autopilot_waypoint or autopilot_objective or autopilot_random then
    if Game.Self.isDriving() then
      for _, ctrl in pairs(flight_controls_T) do
        if PAD.IS_CONTROL_PRESSED(0, ctrl) then
          TASK.CLEAR_PED_TASKS(self.get_ped())
          TASK.CLEAR_PRIMARY_VEHICLE_TASK(current_vehicle)
          gui.show_message("Samurai's Scripts", "Autopilot interrupted! Giving back control to the player.")
          autopilot_waypoint  = false
          autopilot_objective = false
          autopilot_random    = false
          break
        end
      end
    else
      TASK.CLEAR_PED_TASKS(self.get_ped())
      TASK.CLEAR_PRIMARY_VEHICLE_TASK(current_vehicle)
      autopilot_waypoint  = false
      autopilot_objective = false
      autopilot_random    = false
    end
  end
  apki:yield()
end)
script.register_looped("flatbed script", function(script)
  local vehicleHandles  = entities.get_all_vehicles_as_handles()
  local current_vehicle = PED.GET_VEHICLE_PED_IS_USING(self.get_ped())
  local vehicle_model   = ENTITY.GET_ENTITY_MODEL(current_vehicle)
  local flatbedHeading  = ENTITY.GET_ENTITY_HEADING(current_vehicle)
  local flatbedBone     = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(current_vehicle, "chassis")
  local playerPosition  = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
  local playerForwardX  = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
  local playerForwardY  = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
  for _, veh in ipairs(vehicleHandles) do
    local detectPos = vec3:new(playerPosition.x - (playerForwardX * 10), playerPosition.y - (playerForwardY * 10),
      playerPosition.z)
    local vehPos = ENTITY.GET_ENTITY_COORDS(veh, false)
    local vDist = SYSTEM.VDIST(detectPos.x, detectPos.y, detectPos.z, vehPos.x, vehPos.y, vehPos.z)
    if vDist <= 5 then
      closestVehicle = veh
    end
  end
  local closestVehicleModel = 0
  if closestVehicle ~= nil then
    closestVehicleModel = Game.getEntityModel(closestVehicle)
  end
  local iscar   = VEHICLE.IS_THIS_MODEL_A_CAR(closestVehicleModel)
  local isbike  = VEHICLE.IS_THIS_MODEL_A_BIKE(closestVehicleModel)
  local towable = false
  if modelOverride then
    towable = true
  else
    towable = false
  end
  if iscar then
    towable = true
  end
  if isbike then
    towable = true
  end
  if closestVehicleModel == 745926877 then --Buzzard
    towable = true
  end
  if closestVehicleModel == 1353720154 then
    towable = false
  end
  if vehicle_model == 1353720154 then
    is_in_flatbed = true
  else
    is_in_flatbed = false
  end
  if is_in_flatbed and towed_vehicle == 0 then
    if pressing_fltbd_button and towable and closestVehicleModel ~= flatbedModel then
      script:sleep(200)
      local controlled = false
      if closestVehicle ~= nil then
        controlled = entities.take_control_of(closestVehicle, 350)
      end
      if controlled and closestVehicle ~= nil then
        local vehicleClass = VEHICLE.GET_VEHICLE_CLASS(closestVehicle)
        if vehicleClass == 1 then
          tow_zAxis = 0.9
          tow_yAxis = -2.3
        elseif vehicleClass == 2 then
          tow_zAxis = 0.993
          tow_yAxis = -2.17046
        elseif vehicleClass == 6 then
          tow_zAxis = 1.00069420
          tow_yAxis = -2.17046
        elseif vehicleClass == 7 then
          tow_zAxis = 1.009
          tow_yAxis = -2.17036
        elseif vehicleClass == 15 then
          tow_zAxis = 1.3
          tow_yAxis = -2.21069
        elseif vehicleClass == 16 then
          tow_zAxis = 1.5
          tow_yAxis = -2.21069
        else
          tow_zAxis = 1.1
          tow_yAxis = -2.0
        end
        ENTITY.SET_ENTITY_HEADING(closestVehicleModel, flatbedHeading)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(closestVehicle, current_vehicle, flatbedBone, 0.0, tow_yAxis, tow_zAxis, 0.0, 0.0,
          0.0,
          false, true, true, false, 1, true, 1)
        towed_vehicle = closestVehicle
        script:sleep(200)
      else
        gui.show_error("Samurais Scripts", translateLabel("failed_veh_ctrl"))
      end
    end
    if pressing_fltbd_button and closestVehicle ~= nil and not towable then
      gui.show_message("Samurais Scripts", translateLabel("fltbd_carsOnlyTxt"))
      script:sleep(400)
    end
    if pressing_fltbd_button and closestVehicleModel == flatbedModel then
      script:sleep(400)
      gui.show_message("Samurais Scripts", translateLabel("fltbd_nootherfltbdTxt"))
    end
  elseif is_in_flatbed and towed_vehicle ~= 0 then
    if pressing_fltbd_button then
      script:sleep(200)
      for _, v in ipairs(vehicleHandles) do
        local modelHash         = ENTITY.GET_ENTITY_MODEL(v)
        local attachedVehicle   = ENTITY.GET_ENTITY_OF_TYPE_ATTACHED_TO_ENTITY(current_vehicle, modelHash)
        local attachedVehcoords = ENTITY.GET_ENTITY_COORDS(towed_vehicle, false)
        local controlled        = entities.take_control_of(attachedVehicle, 350)
        if ENTITY.DOES_ENTITY_EXIST(attachedVehicle) then
          if controlled then
            ENTITY.DETACH_ENTITY(attachedVehicle, true, true)
            ENTITY.SET_ENTITY_COORDS(attachedVehicle, attachedVehcoords.x - (playerForwardX * 10),
              attachedVehcoords.y - (playerForwardY * 10), playerPosition.z, false, false, false, false)
            VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(towed_vehicle, 5.0)
            towed_vehicle = 0
          end
        end
      end
    end
  end
end)
script.register_looped("TowPos Marker", function()
  if towPos then
    if is_in_flatbed and towed_vehicle == 0 then
      local playerPosition = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
      local playerForwardX = ENTITY.GET_ENTITY_FORWARD_X(self.get_ped())
      local playerForwardY = ENTITY.GET_ENTITY_FORWARD_Y(self.get_ped())
      local detectPos      = vec3:new(playerPosition.x - (playerForwardX * 10), playerPosition.y - (playerForwardY * 10),
        playerPosition.z)
      GRAPHICS.DRAW_MARKER_SPHERE(detectPos.x, detectPos.y, detectPos.z, 2.5, 180, 128, 0, 0.115)
    end
  end
end)
script.register_looped("Handling Editor", function(he)
  he:yield()
  if Game.Self.isOutside() then
    if Game.Self.isDriving() and current_vehicle == last_vehicle and not is_plane and not is_heli then
      if noEngineBraking then
        if not engine_brake_disabled then
          SS.setHandlingFlag(current_vehicle, HF._FREEWHEEL_NO_GAS, true)
          engine_brake_disabled = true
        end
      else
        if engine_brake_disabled then
          SS.setHandlingFlag(current_vehicle, HF._FREEWHEEL_NO_GAS, false)
          engine_brake_disabled = false
        end
      end

      if kersBoost then
        if not kers_boost_enabled and not VEHICLE.GET_VEHICLE_HAS_KERS(current_vehicle) then
          SS.setHandlingFlag(current_vehicle, HF._HAS_KERS, true)
          VEHICLE.SET_VEHICLE_KERS_ALLOWED(current_vehicle, true)
          kers_boost_enabled = true
        end
      else
        if kers_boost_enabled then
          SS.setHandlingFlag(current_vehicle, HF._HAS_KERS, false)
          VEHICLE.SET_VEHICLE_KERS_ALLOWED(current_vehicle, false)
          kers_boost_enabled = false
        end
      end

      if offroaderx2 then
        if not offroader_enabled then
          SS.setHandlingFlag(current_vehicle, HF._OFFROAD_ABILITIES_X2, true)
          offroader_enabled = true
        end
      else
        if offroader_enabled then
          SS.setHandlingFlag(current_vehicle, HF._OFFROAD_ABILITIES_X2, false)
          offroader_enabled = false
        end
      end

      if rallyTires then
        if not rally_tires_enabled then
          SS.setHandlingFlag(current_vehicle, HF._HAS_RALLY_TYRES, true)
          rally_tires_enabled = true
        end
      else
        if rally_tires_enabled then
          SS.setHandlingFlag(current_vehicle, HF._HAS_RALLY_TYRES, false)
          rally_tires_enabled = false
        end
      end

      if noTractionCtrl then
        if not traction_ctrl_disabled then
          SS.setHandlingFlag(current_vehicle, HF._FORCE_NO_TC_OR_SC, true)
          traction_ctrl_disabled = true
        end
      else
        if traction_ctrl_disabled then
          SS.setHandlingFlag(current_vehicle, HF._FORCE_NO_TC_OR_SC, false)
          traction_ctrl_disabled = false
        end
      end

      if easyWheelie then
        if not easy_wheelie_enabled then
          SS.setHandlingFlag(current_vehicle, HF._LOW_SPEED_WHEELIES, true)
          easy_wheelie_enabled = true
        end
      else
        if easy_wheelie_enabled then
          SS.setHandlingFlag(current_vehicle, HF._LOW_SPEED_WHEELIES, false)
          easy_wheelie_enabled = false
        end
      end

      -- if rwSteering then
      --   if not rw_steering_enabled then
      --     SS.setHandlingFlag(current_vehicle, HF._STEER_REARWHEELS, true)
      --     rw_steering_enabled = true
      --   end
      -- else
      --   if rw_steering_enabled then
      --     SS.setHandlingFlag(current_vehicle, HF._STEER_REARWHEELS, false)
      --     rw_steering_enabled = false
      --   end
      -- end

      -- if awSteering then
      --   if not aw_steering_enabled then
      --     SS.setHandlingFlag(current_vehicle, HF._STEER_ALL_WHEELS, true)
      --     aw_steering_enabled = true
      --   end
      -- else
      --   if aw_steering_enabled then
      --     SS.setHandlingFlag(current_vehicle, HF._STEER_ALL_WHEELS, false)
      --     aw_steering_enabled = false
      --   end
      -- end

      -- if handbrakeSteering then
      --   if not hb_steering_enabled then
      --     SS.setHandlingFlag(current_vehicle, HF._HANDBRAKE_REARWHEELSTEER, true)
      --     hb_steering_enabled = true
      --   end
      -- else
      --   if hb_steering_enabled then
      --     SS.setHandlingFlag(current_vehicle, HF._HANDBRAKE_REARWHEELSTEER, false)
      --     hb_steering_enabled = false
      --   end
      -- end
    end
  end
end)
script.register_looped("vehicle creator organizer", function()
  for k, v in ipairs(spawned_vehicles) do
    if not ENTITY.DOES_ENTITY_EXIST(v) then
      table.remove(spawned_vehicles, k)
      table.remove(spawned_vehNames, k)
      table.remove(filteredVehNames, k)
    end
  end

  for k, v in ipairs(veh_attachments) do
    if not ENTITY.DOES_ENTITY_EXIST(v.entity) then
      table.remove(veh_attachments, k)
    end
  end

  if main_vehicle ~= 0 then
    if not ENTITY.DOES_ENTITY_EXIST(main_vehicle) then
      main_vehicle = 0
    end
  end
end)


-- World
script.register_looped("Ped Grabber", function(pg)
  if pedGrabber and not vehicleGrabber and not HUD.IS_MP_TEXT_CHAT_TYPING() and not is_playing_anim
  and not is_playing_scenario and not isCrouched and not is_handsUp and not is_hiding then
    if Game.Self.isOnFoot() and not gui.is_open() and not WEAPON.IS_PED_ARMED(self.get_ped(), 7) then
      local nearestPed = Game.getClosestPed(self.get_ped(), 10)
      local myGroup    = PED.GET_PED_GROUP_INDEX(self.get_ped())
      if not ped_grabbed and nearestPed ~= 0 then
        if PED.IS_PED_ON_FOOT(nearestPed) and not PED.IS_PED_A_PLAYER(nearestPed) and not PED.IS_PED_GROUP_MEMBER(nearestPed, myGroup) then
          if PAD.IS_DISABLED_CONTROL_PRESSED(0, 24) or PAD.IS_DISABLED_CONTROL_PRESSED(0, 257) then
            ped_grabbed, attached_ped = attachPed(nearestPed)
            pg:sleep(200)
            if attached_ped ~= 0 then
              playHandsUp()
              ENTITY.FREEZE_ENTITY_POSITION(attached_ped, true)
              PED.SET_PED_CAN_SWITCH_WEAPON(self.get_ped(), false)
              ped_grabbed = true
            end
          end
        end
      end
      if ped_grabbed and attached_ped ~= 0 then
        PED.FORCE_PED_MOTION_STATE(attached_ped, 0x0EC17E58, false, 0, false)
        if not ENTITY.IS_ENTITY_PLAYING_ANIM(self.get_ped(), "mp_missheist_countrybank@lift_hands", "lift_hands_in_air_outro", 3) then
          playHandsUp()
        end
        if PED.IS_PED_RAGDOLL(self.get_ped()) then
          repeat
            pg:sleep(100)
          until PED.IS_PED_RAGDOLL(self.get_ped()) == false
          playHandsUp()
        end
        if PED.IS_PED_USING_ACTION_MODE(self.get_ped()) then
          repeat
            pg:sleep(100)
          until PED.IS_PED_USING_ACTION_MODE(self.get_ped()) == false
          playHandsUp()
        end
        if PAD.IS_DISABLED_CONTROL_PRESSED(0, 25) then
          if PAD.IS_DISABLED_CONTROL_PRESSED(0, 24) or PAD.IS_DISABLED_CONTROL_PRESSED(0, 257) then
            local myFwdX = Game.getForwardX(self.get_ped())
            local myFwdY = Game.getForwardY(self.get_ped())
            ENTITY.FREEZE_ENTITY_POSITION(attached_ped, false)
            ENTITY.DETACH_ENTITY(attached_ped, true, true)
            TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(attached_ped, false)
            PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(attached_ped, false)
            PED.SET_PED_TO_RAGDOLL(attached_ped, 1500, 0, 0, false, false, false)
            ENTITY.SET_ENTITY_VELOCITY(attached_ped, (pedthrowF * myFwdX), (pedthrowF * myFwdY), 0)
            TASK.CLEAR_PED_TASKS(self.get_ped())
            PED.SET_PED_CAN_SWITCH_WEAPON(self.get_ped(), true)
            pg:sleep(200)
            attached_ped = 0
            ped_grabbed  = false
          end
        end
      end
    end
  end
  pg:yield()
end)
script.register_looped("Vehicle Grabber", function(vg)
  if vehicleGrabber and not pedGrabber and not HUD.IS_MP_TEXT_CHAT_TYPING() and not is_playing_anim
  and not is_playing_scenario and not isCrouched and not is_handsUp and not is_hiding then
    if Game.Self.isOnFoot() and not gui.is_open() and not WEAPON.IS_PED_ARMED(self.get_ped(), 7) then
      local nearestVeh = Game.getClosestVehicle(self.get_ped(), 10)
      if not vehicle_grabbed and nearestVeh ~= 0 then
        if PAD.IS_DISABLED_CONTROL_PRESSED(0, 24) or PAD.IS_DISABLED_CONTROL_PRESSED(0, 257) then
          vehicle_grabbed, grabbed_veh = attachVeh(nearestVeh)
          vg:sleep(200)
          if grabbed_veh ~= 0 then
            playHandsUp()
            PED.SET_PED_CAN_SWITCH_WEAPON(self.get_ped(), false)
            vehicle_grabbed = true
          end
        end
      end
      if vehicle_grabbed and grabbed_veh ~= 0 then
        if not ENTITY.IS_ENTITY_PLAYING_ANIM(self.get_ped(), "mp_missheist_countrybank@lift_hands", "lift_hands_in_air_outro", 3) then
          playHandsUp()
        end
        if PED.IS_PED_RAGDOLL(self.get_ped()) then
          repeat
            vg:sleep(100)
          until PED.IS_PED_RAGDOLL(self.get_ped()) == false
          playHandsUp()
        end
        if PED.IS_PED_USING_ACTION_MODE(self.get_ped()) then
          repeat
            vg:sleep(100)
          until PED.IS_PED_USING_ACTION_MODE(self.get_ped()) == false
          playHandsUp()
        end
        if PAD.IS_DISABLED_CONTROL_PRESSED(0, 25) then
          if PAD.IS_DISABLED_CONTROL_PRESSED(0, 24) or PAD.IS_DISABLED_CONTROL_PRESSED(0, 257) then
            local myFwdX = Game.getForwardX(self.get_ped())
            local myFwdY = Game.getForwardY(self.get_ped())
            ENTITY.DETACH_ENTITY(grabbed_veh, true, true)
            ENTITY.SET_ENTITY_VELOCITY(grabbed_veh, (pedthrowF * myFwdX), (pedthrowF * myFwdY), 0)
            TASK.CLEAR_PED_TASKS(self.get_ped())
            PED.SET_PED_CAN_SWITCH_WEAPON(self.get_ped(), true)
            vg:sleep(200)
            grabbed_veh     = 0
            vehicle_grabbed = false
          end
        end
      end
    end
  end
  vg:yield()
end)
script.register_looped("Carpool", function(cp)
  if carpool then
    if PED.IS_PED_SITTING_IN_ANY_VEHICLE(self.get_ped()) then
      stop_searching = true
    else
      stop_searching = false
    end
    if not stop_searching then
      nearestVeh = Game.getClosestVehicle(self.get_ped(), 10)
    end
    local trying_to_enter = PED.GET_VEHICLE_PED_IS_TRYING_TO_ENTER(self.get_ped())
    if trying_to_enter ~= 0 and trying_to_enter == nearestVeh then
      driverPed = VEHICLE.GET_PED_IN_VEHICLE_SEAT(trying_to_enter, -1, true)
      if driverPed ~= nil and driverPed ~= self.get_ped() and not PED.IS_PED_A_PLAYER(driverPed) then
        thisVeh = trying_to_enter
        PED.SET_PED_CONFIG_FLAG(driverPed, 251, true)
        PED.SET_PED_CONFIG_FLAG(driverPed, 255, true)
        PED.SET_PED_CONFIG_FLAG(driverPed, 398, true)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driverPed, true)
      end
    end
    if PED.IS_PED_SITTING_IN_VEHICLE(self.get_ped(), thisVeh) then
      local ped_to_reset = VEHICLE.GET_PED_IN_VEHICLE_SEAT(thisVeh, -1, true)
      if ped_to_reset ~= nil and ped_to_reset ~= self.get_ped() and not PED.IS_PED_A_PLAYER(ped_to_reset) then
        if VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(thisVeh) > 1 then
          show_npc_veh_ctrls = true
        end
        stop_searching = true
        repeat
          cp:sleep(100)
        until PED.IS_PED_SITTING_IN_VEHICLE(self.get_ped(), thisVeh) == false
        PED.SET_PED_CONFIG_FLAG(ped_to_reset, 251, false)
        PED.SET_PED_CONFIG_FLAG(ped_to_reset, 255, false)
        PED.SET_PED_CONFIG_FLAG(ped_to_reset, 398, false)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped_to_reset, false)
        show_npc_veh_ctrls = false
        stop_searching     = false
      else
        show_npc_veh_ctrls = false
      end
    end
  end
  cp:yield()
end)
script.register_looped("World Bounds", function()
  if extend_world then
    if not world_extended then
      Game.World.extendBounds(true)
      world_extended = true
    end
  end
end)
script.register_looped("Public Seats", function(pseats)
  if public_seats and Game.Self.isOutside() and Game.Self.isOnFoot() and not NETWORK.NETWORK_IS_ACTIVITY_SESSION() and not is_sitting then
    local near_seat, seat, x_offset = SS.isNearPublicSeat()
    if near_seat and Game.Self.isAlive() and not PLAYER.IS_PLAYER_FREE_AIMING(self.get_id())
    and not is_playing_anim and not is_playing_scenario and not ped_grabbed and not vehicle_grabbed
    and not is_handsUp and not isCrouched and not ped_grabbed and not vehicle_grabbed and not is_hiding then
      Game.showButtonPrompt("Press ~INPUT_PICKUP~ to sit down")
      if PAD.IS_CONTROL_PRESSED(0, 38) then
        if Game.requestAnimDict("timetable@ron@ig_3_couch") then
          TASK.TASK_TURN_PED_TO_FACE_ENTITY(self.get_ped(), prop, 100)
          pseats:sleep(150)
          TASK.TASK_PLAY_ANIM(self.get_ped(), "timetable@ron@ig_3_couch", "base", 1.69, 4.0, -1, 33, 1.0, false, false,
            false)
          local bone_index = PED.GET_PED_BONE_INDEX(self.get_ped(), 0)
          ENTITY.ATTACH_ENTITY_TO_ENTITY(self.get_ped(), seat, bone_index, x_offset, -0.6, 1.0, 0.0, 0.0, 180.0, false,
            false, false, false, 20, true, 1)
          pseats:sleep(1000)
          is_sitting = true
        end
      end
    else
      pseats:sleep(1000)
    end
  end
  if is_sitting then
    if PED.IS_PED_IN_MELEE_COMBAT(self.get_ped()) then
      ENTITY.DETACH_ENTITY(self.get_ped(), true, false)
      TASK.CLEAR_PED_TASKS(self.get_ped())
      is_sitting = false
    end
    if PED.IS_PED_RAGDOLL(self.get_ped()) then
      ENTITY.DETACH_ENTITY(self.get_ped(), true, false)
      TASK.CLEAR_PED_TASKS(self.get_ped())
      is_sitting = false
    end
    if PLAYER.IS_PLAYER_FREE_AIMING(self.get_id()) then
      ENTITY.DETACH_ENTITY(self.get_ped(), true, false)
      TASK.CLEAR_PED_TASKS(self.get_ped())
      is_sitting = false
    end
    if not Game.Self.isAlive() then
      ENTITY.DETACH_ENTITY(self.get_ped(), true, false)
      TASK.CLEAR_PED_TASKS(self.get_ped())
      is_sitting = false
    end
    if not ENTITY.IS_ENTITY_PLAYING_ANIM(self.get_ped(), "timetable@ron@ig_3_couch", "base", 3) then
      is_sitting = false
    else
      Game.showButtonPrompt("Press ~INPUT_PICKUP~ to get up")
      if PAD.IS_CONTROL_PRESSED(0, 38) then
        ENTITY.DETACH_ENTITY(self.get_ped(), true, false)
        TASK.STOP_ANIM_TASK(self.get_ped(), "timetable@ron@ig_3_couch", "base", -2.69)
        pseats:sleep(1000)
        is_sitting = false
      end
    end
  end
end)
-- object spawner
script.register_looped("Preview", function(preview)
  if previewLoop and gui.is_open() then
    local currentHeading = ENTITY.GET_ENTITY_HEADING(previewEntity)
    if currentObjectPreview ~= previewEntity then
      ENTITY.DELETE_ENTITY(previewEntity)
      previewStarted = false
    end
    if isChanged then
      ENTITY.DELETE_ENTITY(previewEntity)
      previewStarted = false
    end
    if not ENTITY.IS_ENTITY_DEAD(self.get_ped(), false) then
      while not STREAMING.HAS_MODEL_LOADED(propHash) do
        STREAMING.REQUEST_MODEL(propHash)
        coroutine.yield()
      end
      if not previewStarted then
        previewEntity = OBJECT.CREATE_OBJECT(
          propHash, coords.x + forwardX * 5, coords.y + forwardY * 5, coords.z, false, false, false
        )
        ENTITY.SET_ENTITY_ALPHA(previewEntity, 200.0, false)
        ENTITY.SET_ENTITY_COLLISION(previewEntity, false, false)
        ENTITY.SET_ENTITY_CAN_BE_DAMAGED(previewEntity, false)
        ENTITY.SET_ENTITY_PROOFS(previewEntity, true, true, true, true, true, true, true, true)
        ENTITY.SET_CAN_CLIMB_ON_ENTITY(previewEntity, false)
        OBJECT.SET_OBJECT_ALLOW_LOW_LOD_BUOYANCY(previewEntity, false)
        currentObjectPreview = ENTITY.GET_ENTITY_MODEL(previewEntity)
        previewStarted = true
      end
      if PED.IS_PED_STOPPED(self.get_ped()) then
        while true do
          preview:yield()
          if gui.is_open() and object_spawner:is_selected() then
            currentHeading = currentHeading + 1
            ENTITY.SET_ENTITY_HEADING(previewEntity, currentHeading)
            preview:sleep(10)
            if currentObjectPreview ~= ENTITY.GET_ENTITY_MODEL(previewEntity) then
              ENTITY.DELETE_ENTITY(previewEntity)
              previewStarted = false
            end
            if not PED.IS_PED_STOPPED(self.get_ped()) or not previewStarted then
              previewStarted = false
              break
            end
          else
            ENTITY.DELETE_ENTITY(previewEntity)
            previewStarted = false
          end
        end
      else
        return
      end
    end
  else
    ENTITY.DELETE_ENTITY(previewEntity)
    stopPreview()
  end
end)
script.register_looped("edit mode", function()
  if spawned_props[1] ~= nil then
    if edit_mode and not ENTITY.IS_ENTITY_ATTACHED(selectedObject.entity) then
      local current_coords   = ENTITY.GET_ENTITY_COORDS(selectedObject.entity, true)
      local current_rotation = ENTITY.GET_ENTITY_ROTATION(selectedObject.entity, 2)
      if activeX then
        ENTITY.SET_ENTITY_COORDS(selectedObject.entity, current_coords.x + spawnDistance.x, current_coords.y,
          current_coords.z,
          false, false, false, false)
      end
      if activeY then
        ENTITY.SET_ENTITY_COORDS(selectedObject.entity, current_coords.x, current_coords.y + spawnDistance.y,
          current_coords.z,
          false, false, false, false)
      end
      if activeZ then
        ENTITY.SET_ENTITY_COORDS(selectedObject.entity, current_coords.x, current_coords.y,
          current_coords.z + spawnDistance.z,
          false, false, false, false)
      end
      if rotX then
        ENTITY.SET_ENTITY_ROTATION(selectedObject.entity, current_rotation.x + spawnRot.x, current_rotation.y,
          current_rotation.z, 2, true)
      end
      if rotY then
        ENTITY.SET_ENTITY_ROTATION(selectedObject.entity, current_rotation.x, current_rotation.y + spawnRot.y,
          current_rotation.z, 2, true)
      end
      if rotZ then
        ENTITY.SET_ENTITY_ROTATION(selectedObject.entity, current_rotation.x, current_rotation.y,
          current_rotation.z + spawnRot.z, 2, true)
      end
    end
    for k, v in ipairs(spawned_props) do
      if not ENTITY.DOES_ENTITY_EXIST(v.entity) then
        table.remove(spawned_props, k)
      end
    end
  end
  if attached_props[1] ~= nil then
    for i, v in ipairs(attached_props) do
      if not ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(v.entity, self.get_ped()) then
        table.remove(attached_props, i)
      end
    end
  end
  if vehicle_attachments[1] ~= nil then
    for i, v in ipairs(vehicle_attachments) do
      if not ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(v.entity, self.get_veh()) then
        table.remove(vehicle_attachments, i)
      end
    end
  end
  if spawned_persist_T[1] ~= nil then
    for k, v in ipairs(spawned_persist_T) do
      if not ENTITY.DOES_ENTITY_EXIST(v) then
        table.remove(spawned_persist_T, k)
      end
    end
  end
  if vehAttachments[1] ~= nil then
    for index, entity in ipairs(vehAttachments) do
      if not ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(entity, current_vehicle) then
        table.remove(vehAttachments, index)
      end
    end
  end
  if selfAttachments[1] ~= nil then
    for k, v in ipairs(selfAttachments) do
      if not ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(v.entity, self.get_ped()) then
        table.remove(selfAttachments, k)
      end
    end
  end
end)

script.register_looped("KamikazeDrivers", function(rd)
  if kamikazeDrivers and Game.Self.isAlive() then
    local gta_peds = entities.get_all_peds_as_handles()
    local myGroup  = PED.GET_PED_GROUP_INDEX(self.get_ped())
    for _, ped in pairs(gta_peds) do
      if ped ~= self.get_ped() and not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_GROUP_MEMBER(ped, myGroup) then
        if PED.IS_PED_SITTING_IN_ANY_VEHICLE(ped) then
          local ped_veh = PED.GET_VEHICLE_PED_IS_USING(ped)
          if VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(ped_veh) then
            if VEHICLE.IS_VEHICLE_STOPPED(ped_veh) then
              TASK.TASK_VEHICLE_TEMP_ACTION(ped, ped_veh, 23, 1000)
            end
            if ENTITY.GET_ENTITY_SPEED(ped_veh) > 1.8 and ENTITY.GET_ENTITY_SPEED(ped_veh) < 70 then
              if VEHICLE.IS_VEHICLE_ON_ALL_WHEELS(ped_veh) and not ENTITY.IS_ENTITY_DEAD(ped, false) then
                VEHICLE.SET_VEHICLE_BRAKE(ped_veh, false)
                VEHICLE.SET_VEHICLE_FORWARD_SPEED(ped_veh, (ENTITY.GET_ENTITY_SPEED(ped_veh) + 0.7))
              end
            end
          end
        end
      end
    end
  end
  rd:yield()
end)

script.register_looped("Public Enemy", function(pe)
  if publicEnemy and Game.Self.isAlive() then
    local myGroup  = PED.GET_PED_GROUP_INDEX(self.get_ped())
    local gta_peds = entities.get_all_peds_as_handles()
    for _, ped in pairs(gta_peds) do
      if ped ~= self.get_ped() and not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_GROUP_MEMBER(ped, myGroup) then
        for _, attr in ipairs(pe_combat_attributes_T) do
          PED.SET_PED_COMBAT_ATTRIBUTES(ped, attr.id, attr.bool)
        end
        if not PED.IS_PED_IN_COMBAT(ped, self.get_ped()) then
          PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
          for _, cflg in ipairs(pe_config_flags_T) do
            if not PED.GET_PED_CONFIG_FLAG(ped, cflg.id, cflg.bool) then
              PED.SET_PED_CONFIG_FLAG(ped, cflg.id, cflg.bool)
            end
          end
          TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
          PLAYER.SET_POLICE_IGNORE_PLAYER(self.get_id(), true)
          PLAYER.SET_MAX_WANTED_LEVEL(0)
          TASK.TASK_COMBAT_PED(ped, self.get_ped(), 0, 16)
        end
      end
    end
  end
  pe:yield()
end)

---online

-- Casino Pacino
script.register_looped("Casino Pacino Thread", function(pacino)
  if Game.isOnline() then
    if force_poker_cards then
      local player_id = PLAYER.PLAYER_ID()
      if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("three_card_poker")) ~= 0 then
        while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 3, 0) ~= player_id do
          network.force_script_host("three_card_poker")
          gui.show_message("CasinoPacino", "Taking control of the three_card_poker script.") --If you see this spammed, someone if fighting you for control.
          pacino:sleep(500)
        end
        local players_current_table = locals.get_int("three_card_poker",
          three_card_poker_table + 1 + (player_id * three_card_poker_table_size) + 2) --The Player's current table he is sitting at.
        if (players_current_table ~= -1) then                                         -- If the player is sitting at a poker table
          local player_0_card_1 = locals.get_int("three_card_poker",
            (three_card_poker_cards) + (three_card_poker_current_deck) +
            (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (1) + (0 * 3))
          local player_0_card_2 = locals.get_int("three_card_poker",
            (three_card_poker_cards) + (three_card_poker_current_deck) +
            (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (2) + (0 * 3))
          local player_0_card_3 = locals.get_int("three_card_poker",
            (three_card_poker_cards) + (three_card_poker_current_deck) +
            (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (3) + (0 * 3))
          if player_0_card_1 ~= 50 or player_0_card_2 ~= 51 or player_0_card_3 ~= 52 then --Check if we need to overwrite the deck.
            local total_players = 0
            for player_iter = 0, 31, 1 do
              local player_table = locals.get_int("three_card_poker",
                three_card_poker_table + 1 + (player_iter * three_card_poker_table_size) + 2)
              if player_iter ~= player_id and player_table == players_current_table then --An additional player is sitting at the user's table.
                total_players = total_players + 1
              end
            end
            for playing_player_iter = 0, total_players, 1 do
              set_poker_cards(playing_player_iter, players_current_table, 50, 51, 52)
            end
            if set_dealers_poker_cards then
              set_poker_cards(total_players + 1, players_current_table, 1, 8, 22)
            end
          end
        end
      end
    end

    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("blackjack")) ~= 0 then
      local dealers_card = 0
      local blackjack_table = locals.get_int("blackjack",
        blackjack_table_players + 1 + (PLAYER.PLAYER_ID() * blackjack_table_players_size) + 4)                             --The Player's current table he is sitting at.
      if blackjack_table ~= -1 then
        dealers_card     = locals.get_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 1) --Dealer's facedown card.
        dealers_card_str = get_cardname_from_index(dealers_card)
      else
        dealers_card_str = "Not sitting at a Blackjack table."
      end
    else
      dealers_card_str = "Not in Casino."
    end

    if force_roulette_wheel then
      local player_id = PLAYER.PLAYER_ID()
      if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casinoroulette")) ~= 0 then
        while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 3, 0) ~= player_id do
          network.force_script_host("casinoroulette")
          gui.show_message("CasinoPacino", "Taking control of the casinoroulette script.") --If you see this spammed, someone if fighting you for control.
          script:sleep(500)
        end
        for tabler_iter = 0, 6, 1 do
          locals.set_int("casinoroulette",
            (roulette_master_table) + (roulette_outcomes_table) + (roulette_ball_table) + (tabler_iter), 18)
        end
      end
    end

    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_slots")) ~= 0 then
      local needs_run = false
      if rig_slot_machine then
        for slots_iter = 3, 196, 1 do
          if slots_iter ~= 67 and slots_iter ~= 132 then
            if locals.get_int("casino_slots", (slots_random_results_table) + (slots_iter)) ~= 6 then
              needs_run = true
            end
          end
        end
      else
        local sum = 0
        for slots_iter = 3, 196, 1 do
          if slots_iter ~= 67 and slots_iter ~= 132 then
            sum = sum + locals.get_int("casino_slots", (slots_random_results_table) + (slots_iter))
          end
        end
        needs_run = sum == 1152
      end
      if needs_run then
        for slots_iter = 3, 196, 1 do
          if slots_iter ~= 67 and slots_iter ~= 132 then
            local slot_result = 6
            if not rig_slot_machine then
              math.randomseed(os.time() + slots_iter)
              slot_result = math.random(0, 7)
            end
            locals.set_int("casino_slots", (slots_random_results_table) + (slots_iter), slot_result)
          end
        end
      end
      if autoplay_slots then
        local slotstate = locals.get_int("casino_slots", slots_slot_machine_state) --Local Laddie️™®️© is a product of Limited Laddies LLC, all rights reserved.
        if slotstate & (1 << 0) == 1 then                                          --The user is sitting at a slot machine.
          local chips = stats.get_int('MPX_CASINO_CHIPS')
          local chip_cap = autoplay_chips_cap
          if (autoplay_cap and chips < chip_cap) or not autoplay_cap then
            if (slotstate & (1 << 24) == 0) then --The slot machine is not currently spinning.
              script:yield()                     -- Wait for the previous spin to clean up, if we just came from a spin.
              slotstate = slotstate | (1 << 3)   -- Bitwise set the 3rd bit (begin playing)
              locals.set_int("casino_slots", slots_slot_machine_state, slotstate)
              script:sleep(500)                  --If we rewrite the begin playing bit again, the machine will get stuck.
            end
          end
        end
      end
    end
    if bypass_casino_bans then
      stats.set_int("MPPLY_CASINO_CHIPS_WON_GD", 0)
      stats.set_int("MPPLY_CASINO_CHIPS_WONTIM", 0)
      stats.set_int("MPPLY_CASINO_GMBLNG_GD", 0)
      stats.set_int("MPPLY_CASINO_BAN_TIME", 0)
      stats.set_int("MPPLY_CASINO_CHIPS_PURTIM", 0)
      stats.set_int("MPPLY_CASINO_CHIPS_PUR_GD", 0)
      stats.set_int("MPPLY_CASINO_CHIPS_SOLD", 0)
      stats.set_int("MPPLY_CASINO_CHIPS_SELTIM", 0)
    end
    if gui.is_open() and casino_pacino:is_selected() then
      casino_heist_approach      = stats.get_int("MPX_H3OPT_APPROACH")
      casino_heist_target        = stats.get_int("MPX_H3OPT_TARGET")
      casino_heist_last_approach = stats.get_int("MPX_H3_LAST_APPROACH")
      casino_heist_hard          = stats.get_int("MPX_H3_HARD_APPROACH")
      casino_heist_gunman        = stats.get_int("MPX_H3OPT_CREWWEAP")
      casino_heist_driver        = stats.get_int("MPX_H3OPT_CREWDRIVER")
      casino_heist_hacker        = stats.get_int("MPX_H3OPT_CREWHACKER")
      casino_heist_weapons       = stats.get_int("MPX_H3OPT_WEAPS")
      casino_heist_cars          = stats.get_int("MPX_H3OPT_VEHS")
      casino_heist_masks         = stats.get_int("MPX_H3OPT_MASKS")
      local cooldown_time        = tunables.get_int("VC_CASINO_CHIP_MAX_WIN_LOSS_COOLDOWN")
      local time_delta           = os.time() -
          stats.get_int("MPPLY_CASINO_CHIPS_WONTIM") --"I've won the jackpot, and it doesn't make me feel bad." ~Casino Pacino (He only cares about winners)
      local minutes_left         = (cooldown_time - time_delta) / 60
      local chipswon_gd          = stats.get_int("MPPLY_CASINO_CHIPS_WON_GD")
      local max_chip_wins        = tunables.get_int("VC_CASINO_CHIP_MAX_WIN_DAILY")
      casino_cooldown_update_str = (chipswon_gd >= max_chip_wins and "Cooldown expires in approximately: " .. string.format("%.2f", minutes_left) .. " minute(s)." or "Off Cooldown")
    end
    if fm_mission_controller_cart_autograb then
      if locals.get_int("fm_mission_controller", fm_mission_controller_cart_grab) == 3 then
        locals.set_int("fm_mission_controller", fm_mission_controller_cart_grab, 4)
      elseif locals.get_int("fm_mission_controller", fm_mission_controller_cart_grab) == 4 then
        locals.set_float("fm_mission_controller", fm_mission_controller_cart_grab + fm_mission_controller_cart_grab_speed,
          2)
      end
    end
  end
end)

script.register_looped("OPI", function()
  if Game.isOnline() and gui.is_open() and players_tab:is_selected() then
    playerCount       = Game.getPlayerCount()
    selectedPlayer    = filteredPlayers[playerIndex + 1]
    targetPlayerPed   = selectedPlayer
    targetPlayerIndex = NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(targetPlayerPed)
    player_name       = PLAYER.GET_PLAYER_NAME(targetPlayerIndex)
    if NETWORK.NETWORK_IS_PLAYER_ACTIVE(targetPlayerIndex) then
      player_active = true
      playerWallet  = Game.getPlayerWallet(targetPlayerIndex)
      playerBank    = Game.getPlayerBank(targetPlayerIndex)
      playerCoords  = Game.getCoords(targetPlayerPed, false)
      playerHeading = math.floor(Game.getHeading(targetPlayerPed))
      playerHealth  = ENTITY.GET_ENTITY_HEALTH(targetPlayerPed)
      playerArmour  = PED.GET_PED_ARMOUR(targetPlayerPed)
      godmode       = PLAYER.GET_PLAYER_INVINCIBLE(targetPlayerIndex)
      if PED.IS_PED_SITTING_IN_ANY_VEHICLE(targetPlayerPed) then
        player_in_veh = true
        playerVeh = PED.GET_VEHICLE_PED_IS_IN(targetPlayerPed, true)
      else
        player_in_veh = false
      end
    else
      player_active = false
    end
  end
end)
script.register_looped("CDK", function(cdk)
  if Game.isOnline() and TARGET_BUILD == CURRENT_BUILD then
    cdk:sleep(15000)
    if mc_work_cd then
      if globals.get_int(Global_262145.f_18571) > 0 then
        globals.set_int(Global_262145.f_18571, 0)
      end
    end
    if hangar_cd then
      if globals.get_int(Global_262145.f_22433) > 0 then
        globals.set_int(Global_262145.f_22433, 0)
      end
      if globals.get_int(Global_262145.f_22434) > 0 then
        globals.set_int(Global_262145.f_22434, 0)
      end
      if globals.get_int(Global_262145.f_22435) > 0 then
        globals.set_int(Global_262145.f_22435, 0)
      end
    end
    if nc_management_cd then
      if globals.get_int(Global_262145.f_24026) > 0 then
        globals.set_int(Global_262145.f_24026, 0)
      end
    end
    if nc_vip_mission_chance then
      if globals.get_int(Global_262145.f_31882) > 0 then
        globals.set_int(Global_262145.f_31882, 0)
      end
    else
      if globals.get_int(Global_262145.f_31882) == 0 then
        globals.set_int(Global_262145.f_31882, 50)
      end
    end
    if security_missions_cd then
      if globals.get_int(Global_262145.f_31038) > 0 then
        globals.set_int(Global_262145.f_31038, 0)
      end
    end
    if ie_vehicle_steal_cd then
      if globals.get_int(Global_262145.f_19077) > 0 then
        globals.set_int(Global_262145.f_19077, 0)
      end
    end
    if ie_vehicle_sell_cd then
      if globals.get_int(Global_262145.f_19153) > 0 then
        globals.set_int(Global_262145.f_19153, 0)
      end
      if globals.get_int(Global_262145.f_19432) > 0 then
        globals.set_int(Global_262145.f_19432, 0)
      end
      if globals.get_int(Global_262145.f_19433) > 0 then
        globals.set_int(Global_262145.f_19433, 0)
      end
      if globals.get_int(Global_262145.f_19434) > 0 then
        globals.set_int(Global_262145.f_19434, 0)
      end
      if globals.get_int(Global_262145.f_19435) > 0 then
        globals.set_int(Global_262145.f_19435, 0)
      end
    end
    if ceo_crate_buy_cd then
      if globals.get_int(Global_262145.f_15499) > 0 then
        globals.set_int(Global_262145.f_15499, 0)
      end
      if globals.get_int(Global_262145.f_15501) > 0 then
        globals.set_int(Global_262145.f_15501, 0)
      end
    end
    if ceo_crate_sell_cd then
      if globals.get_int(Global_262145.f_15500) > 0 then
        globals.set_int(Global_262145.f_15500, 0)
      end
      if globals.get_int(Global_262145.f_15502) > 0 then
        globals.set_int(Global_262145.f_15502, 0)
      end
    end
  end
end)

---MISC
script.register_looped("Flight Music", function()
  if disableFlightMusic then
    if not flight_music_off then
      AUDIO.SET_AUDIO_FLAG("DisableFlightMusic", true)
      flight_music_off = true
    end
  end
end)

---Remote Options
script.register_looped("REOPT", function(ro)
  if SS.isKeyJustPressed(keybinds.autokill.code) then
    if autoKill then
      autoKill = false
      gui.show_message("Samurai's Scripts", "Auto-Kill Enemies disabled.")
      ro:sleep(100)
    else
      autoKill = true
      gui.show_success("Samurai's Scripts", "Auto-Kill Enemies enabled.")
      ro:sleep(100)
    end
    lua_cfg.save("autoKill", autoKill)
  end
  if SS.isKeyJustPressed(keybinds.enemiesFlee.code) then
    if runaway then
      runaway = false
      gui.show_message("Samurai's Scripts", "Enemies Flee disabled.")
      ro:sleep(100)
    else
      runaway = true
      gui.show_success("Samurai's Scripts", "Enemies Flee enabled.")
      ro:sleep(100)
    end
    lua_cfg.save("runaway", runaway)
  end
end)

-- PANIK Button
script.register_looped("PANIK", function(panik)
  if SS.isKeyJustPressed(keybinds.panik.code) and not HUD.IS_MP_TEXT_CHAT_TYPING() and not HUD.IS_PAUSE_MENU_ACTIVE()
  and not is_typing and not is_setting_hotkeys and not gui.is_open() and not script.is_active("CELLPHONE_FLASHHAND") then
    panik:sleep(200)
    SS.handle_events()
    UI.widgetSound("Fail")
    gui.show_message("PANIK!", "(Ó _ Ò )!!")
  end
end)

---IsKeyJustPressed
script.register_looped("IKJP", function(ikjp)
  for _, k in ipairs(VK_T) do
    if k.just_pressed then
      ikjp:sleep(0.2)
      k.just_pressed = false
    end
  end
end)


--[[
   *event handlers*
]]
event.register_handler(menu_event.MenuUnloaded, function()
  SS.handle_events()
end)

event.register_handler(menu_event.ScriptsReloaded, function()
  SS.handle_events()
end)

event.register_handler(menu_event.Wndproc, function(hwnd, msg, wParam, lParam)
  if msg == WM._KEYDOWN or msg == WM._SYSKEYDOWN or msg == WM._XBUTTONDOWN then
    for _, key in ipairs(VK_T) do
      if wParam == key.code then
        key.pressed      = true
        key.just_pressed = true
        if key.just_pressed then
          SS.debug(
            "\10--- Pressed Key ---" .. "\10 ¤ Name:       " .. key.name .. "\10 ¤ Keycode:    " ..
            lua_Fn.decimalToHex(wParam, 16) .. "\10 ¤ Bit 24 Set: " .. tostring((lParam & (0x1 << 24)) > 0)
            .. "\10 ¤ SYSKEY:     " .. tostring(msg == WM._SYSKEYDOWN)
          )
        end
        break
      end
    end
  elseif msg == WM._KEYUP or msg == WM._SYSKEYUP then
    for _, key in ipairs(VK_T) do
      if wParam == key.code then
        if key.pressed then
          key.pressed      = false
          key.just_pressed = false
          break
        end
      end
    end
  elseif msg == WM._XBUTTONUP then
    for _, key in ipairs(VK_T) do
      if key.code == 0x10020 then
        if key.pressed then
          key.pressed      = false
          key.just_pressed = false
          break
        end
      elseif key.code == 0x20040 then
        if key.pressed then
          key.pressed      = false
          key.just_pressed = false
          break
        end
      end
    end
  end
end)
