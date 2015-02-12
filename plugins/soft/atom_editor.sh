# Name: Install Atom
# Command: atom_editor
 
atom_editor() {
show_func "Installing Atom"
if [[ "$(atom_editor_test)" = "Installed" ]]; then
	show_status "Atom already installed"
else
	if [[ ! "$arch" = "64" ]]; then
		show_msg "Atom is only available for a 64-bit system"
		exit_state
	else
		show_msg "Getting latest version"
		get="https://atom.io/download/rpm"
		file="atom.x86_64.rpm"
		get_file
		if [[ -f "$file" ]]; then
			show_msg "Installing files"
			install_pkg "$file"
			[[ "$(atom_editor_test)" = "Installed" ]]; exit_state
		fi
	fi
fi
}
 
atom_editor_undo() {
show_func "Uninstalling Atom"
erase_pkg atom
[[ ! "$(atom_editor_test)" = "Installed" ]]; exit_state
}
 
atom_editor_test() {
query_pkg atom
if [[ $? -eq 0 ]]; then
printf "Installed"
else
printf "Not installed"
fi
} 
