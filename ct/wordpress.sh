#!/usr/bin/env bash
HELPER_SCRIPTS_ROOT="${HELPER_SCRIPTS_ROOT:-"https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main"}"
source <(curl -fsSL $HELPER_SCRIPTS_ROOT/misc/build.func)
# Copyright (c) 2021-2025 communtiy-scripts ORG
# Author: MickLesk (Canbiz)
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: https://wordpress.org/

## App Default Values
APP="Wordpress"
var_tags="${var_tags:-blog;cms}"
var_disk="${var_disk:-5}"
var_cpu="${var_cpu:-2}"
var_ram="${var_ram:-2048}"
var_os="${var_os:-debian}"
var_version="${var_version:-13}"

header_info "$APP"
variables
color
catch_errors

function update_script() {
  header_info
  check_container_storage
  check_container_resources
  if [[ ! -d /var/www/html/wordpress ]]; then
    msg_error "No ${APP} Installation Found!"
    exit
  fi
  msg_error "Wordpress should be updated via the user interface."
  exit
}

start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${CREATING}${GN} ${APP} setup has been successfully initialized!${CL}"
echo -e "${INFO}${YW} Access it using the following URL:${CL}"
echo -e "${TAB}${GATEWAY}${BGN}http://${IP}/${CL}"
