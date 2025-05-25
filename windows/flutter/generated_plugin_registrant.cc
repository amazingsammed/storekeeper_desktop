//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <connectivity_plus/connectivity_plus_windows_plugin.h>
#include <datatablex/datatablex_plugin_c_api.h>
#include <file_selector_windows/file_selector_windows.h>
#include <sqlbase/sqlbase_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  ConnectivityPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ConnectivityPlusWindowsPlugin"));
  DatatablexPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DatatablexPluginCApi"));
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
  SqlbasePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SqlbasePluginCApi"));
}
