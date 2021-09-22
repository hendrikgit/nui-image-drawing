#include "nw_inc_nui"

void main()
{
  sqlquery q = SqlPrepareQueryCampaign("nui_images", "select draw_list from nui_images where name = @name");
  SqlBindString(q, "@name", "test");
  SqlStep(q);
  PrintString("SqlGetJson start");
  json jDrawListItems = SqlGetJson(q, 0);
  PrintString("SqlGetJson end");

  json jDrawList = NuiDrawList(NuiSpacer(), JsonBool(TRUE), jDrawListItems);

  json jRow = JsonArrayInsert(JsonArray(), jDrawList);
  json jRoot = NuiRow(jRow);
  json jWindow = NuiWindow(jRoot, JsonString("NUI Image drawing"), NuiRect(-1.0, -1.0, 250.0, 250.0), JsonBool(FALSE), JsonBool(FALSE), JsonBool(TRUE), JsonBool(FALSE), JsonBool(TRUE));
  PrintString("NuiCreate start");
  NuiCreate(GetFirstPC(), jWindow, "imagedraw");
  PrintString("NuiCreate end");
}
