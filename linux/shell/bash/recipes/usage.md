Source: https://github.com/cardano-community/guild-operators/blob/alpha/scripts/cnode-helper-scripts/topologyUpdater.sh

```bash
usage() {
  cat <<-EOF
		Usage: $(basename "$0") [-b <branch name>] [-f] [-p]
		Topology Updater - Build topology with community pools

		-f    Disable fetch of a fresh topology file
		-p    Disable node alive push to Topology Updater API
		-u    Skip script update check overriding UPDATE_CHECK value in env
		-b    Use alternate branch to check for updates - only for testing/development (Default: master)
		
		EOF
  exit 1
}
```