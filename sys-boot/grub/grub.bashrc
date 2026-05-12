# Per-package flag overrides for sys-boot/grub on arm64-openfyde_vmware.
#
# grub builds with the cross-aarch64 gcc-10.2.0 shipped in the CrOS SDK,
# which does not recognise the clang-only "-mcpu=apple-m1" tuning set in
# the board's BOARD_COMPILER_FLAGS. Strip it out before configure runs.

cros_pre_src_configure_filter_clang_flag() {
  filter_apple_m1_for_gcc
}
