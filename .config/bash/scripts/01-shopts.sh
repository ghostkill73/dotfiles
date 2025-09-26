############################################################
# Bash shopts
############################################################

shopt_list=(
	cdspell
	histappend
	checkwinsize
	autocd
	cdable_vars
	checkhash
	dirspell
	globstar
	no_empty_cmd_completion
)

for opt in "${shopt_list[@]}"; do
	shopt -s "$opt"
done
unset shopt_list
