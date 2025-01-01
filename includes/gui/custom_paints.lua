---@diagnostic disable

function customPaintsUI()
  if current_vehicle == 0 then
    ImGui.Dummy(1, 5); ImGui.Text(GET_IN_VEH_WARNING_)
  else
    ImGui.BulletText(SORT_BY_TXT_); ImGui.SameLine()
    paints_sortby_switch, isChanged = ImGui.RadioButton(SORT_BY_COLOR_TXT_, paints_sortby_switch, 0); ImGui.SameLine(); ImGui
        .Dummy(35, 1)
    if isChanged then
      UI.widgetSound("Nav")
    end
    ImGui.SameLine(); paints_sortby_switch, isChanged = ImGui.RadioButton(SORT_BY_MFR_TXT_, paints_sortby_switch, 1)
    if isChanged then
      UI.widgetSound("Nav")
    end
    ImGui.PushItemWidth(180)
    if paints_sortby_switch == 0 then
      ImGui.Dummy(20, 1); ImGui.SameLine()
      paints_col_sort_idx, sortbyUsed = ImGui.Combo("##sortpaintjobs", paints_col_sort_idx, paints_sortByColors,
        #paints_sortByColors)
      if sortbyUsed then
        UI.widgetSound("Nav")
        custom_paint_index = 0
      end
      ImGui.SameLine(); showPaintsCount()
    else
      ImGui.Dummy(120, 1); ImGui.SameLine(); showPaintsCount(); ImGui.SameLine()
      paints_mfr_sort_idx, sortbyMfrUsed = ImGui.Combo("##sortpaintjobs2", paints_mfr_sort_idx, paints_sortByMfrs,
        #paints_sortByMfrs)
      if sortbyMfrUsed then
        UI.widgetSound("Nav")
        custom_paint_index = 0
      end
    end
    ImGui.PopItemWidth()
    ImGui.PushItemWidth(420)
    custom_paints_sq, cpsqUsed = ImGui.InputTextWithHint("##custompaintssq", "Search", custom_paints_sq, 64)
    is_typing = ImGui.IsItemActive()
    displayCustomPaints()
    ImGui.PopItemWidth()
    local selected_paint = filteredPaints[custom_paint_index + 1]
    ImGui.Spacing()
    ImGui.BeginDisabled(selected_paint == nil)
    mf_overwrite, movwUsed = ImGui.Checkbox("Matte Finish", selected_paint ~= nil and selected_paint.m or false)
    UI.toolTip(false, APPLY_MATTE_DESC_)
    if movwUsed then
      UI.widgetSound("Nav2")
      selected_paint.m = not selected_paint.m
    end
    ImGui.Separator()
    is_primary, isPused = ImGui.Checkbox("Primary", is_primary); ImGui.SameLine()
    is_secondary, isSused = ImGui.Checkbox("Secondary", is_secondary)
    if isPused or isSused then
      UI.widgetSound("Nav2")
    end
    if ImGui.Button(GENERIC_CONFIRM_BTN_, 80, 40) and selected_paint ~= nil then -- fine, sumneko! I submit to your needs.
      if not is_primary and not is_secondary then
        UI.widgetSound("Error")
        gui.show_error("Samurai's Scripts", "Please select primary or secondary or both.")
      else
        UI.widgetSound("Select")
        Game.Vehicle.setCustomPaint(current_vehicle, selected_paint.hex, selected_paint.p, selected_paint.m, is_primary,
          is_secondary)
      end
    end
    ImGui.EndDisabled()
    if selected_paint ~= nil then
      UI.toolTip(false, SAVE_PAINT_DESC_)
    end
  end
end
