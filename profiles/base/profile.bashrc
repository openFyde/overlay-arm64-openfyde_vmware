# Substitute "-mcpu=apple-m1" with generic armv8-a tuning that gcc-10.2
# understands. Apple cores were added to GCC in 12+, but the CrOS SDK
# cross-aarch64 toolchain is still on 10.2.
filter_apple_m1_for_gcc() {
  local var flag flags
  for var in CFLAGS CXXFLAGS; do
    flags=()
    for flag in ${!var}; do
      case "${flag}" in
      -mcpu=apple-m1)
        flag="-march=armv8-a+crc+crypto"
        ;;
      esac
      flags+=("${flag}")
    done
    export "${var}=${flags[*]}"
  done
}

arm64_vmware_stack_bashrc() {
  local cfg cfgd

  cfgd="/mnt/host/source/src/overlays/overlay-arm64-openfyde_vmware/${CATEGORY}/${PN}"
  for cfg in ${PN} ${P} ${PF} ; do
    cfg="${cfgd}/${cfg}.bashrc"
    [[ -f ${cfg} ]] && . "${cfg}"
  done

  export ARM64_VMWARE_BASHRC_FILESDIR="${cfgd}/files"
}

arm64_vmware_stack_bashrc
