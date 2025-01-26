#!/usr/bin/env bash

: "${CLEAN:=0}"
: "${DEBUG:=0}"

function clean_config() {
	defaults delete com.brave.Browser BraveVPNDisabled || true
	defaults delete com.brave.Browser BraveRewardsDisabled || true
	defaults delete com.brave.Browser BraveWalletDisabled || true
	defaults delete com.brave.Browser BraveAIChatEnabled || true
	defaults delete com.brave.Browser PasswordManagerEnabled || true
	defaults delete com.brave.Browser TorDisabled || true
	defaults delete com.brave.Browser BraveAdsEnabled || true
	defaults delete com.brave.Browser SyncDisabled || true
}

function write_config() {
	defaults write com.brave.Browser BraveVPNDisabled -bool yes
	defaults write com.brave.Browser BraveRewardsDisabled -bool yes
	defaults write com.brave.Browser BraveWalletDisabled -bool yes
	defaults write com.brave.Browser BraveAIChatEnabled -bool no
	defaults write com.brave.Browser PasswordManagerEnabled -bool no
	defaults write com.brave.Browser TorDisabled -bool yes
	defaults write com.brave.Browser BraveAdsEnabled -bool no
	defaults write com.brave.Browser SyncDisabled -bool yes
}

# main
if [[ "${BASH_SOURCE[0]}" != "$0" ]]; then
	echo "${BASH_SOURCE[0]} is being sourced" >&2
else
	set -euo pipefail
	if (( DEBUG == 1 )); then 
		set -x
	fi

	if (( CLEAN == 1 )); then
		clean_config
	else
		write_config
	fi
fi
