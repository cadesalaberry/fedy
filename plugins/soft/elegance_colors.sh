# Name: Install Elegance Colors
# Command: elegance_colors

elegance_colors() {
show_func "Installing Elegance Colors Gnome Shell theme"
if [[ "$(elegance_colors_test)" = "Installed" && ! "$reinstall" = "yes" ]]; then
    show_status "Elegance Colors Gnome Shell theme already installed"
else
    install_pkg bc gnome-shell ImageMagick
    add_repo "elegance-colors.repo"
    install_pkg_prevrel "elegance-colors.repo" gnome-shell-theme-elegance-colors
fi
[[ "$(elegance_colors_test)" = "Installed" ]]; exit_state
}

elegance_colors_undo() {
show_func "Uninstalling Elegance Colors Gnome Shell theme"
erase_pkg gnome-shell-theme-elegance-colors
remove_repo "elegance-colors.repo"
[[ ! "$(elegance_colors_test)" = "Installed" ]]; exit_state
}

elegance_colors_test() {
if [[ -f /usr/bin/elegance-colors ]]; then
    printf "Installed"
else
    printf "Not installed"
fi
}