/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembly of APIC, Wed May 21 11:30:52 2025
 *
 * ACPI Data Table [APIC]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
[004h 0004   4]                 Table Length : 0000010C
[008h 0008   1]                     Revision : 04
[009h 0009   1]                     Checksum : 38
[00Ah 0010   6]                       Oem ID : "VMWARE"
[010h 0016   8]                 Oem Table ID : "VMWVBSA!"
[018h 0024   4]                 Oem Revision : 20201221
[01Ch 0028   4]              Asl Compiler ID : "VMW "
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]           Local Apic Address : 00000000
[028h 0040   4]        Flags (decoded below) : 00000000
                         PC-AT Compatibility : 0

[02Ch 0044   1]                Subtable Type : 0B [Generic Interrupt Controller]
[02Dh 0045   1]                       Length : 50
[02Eh 0046   2]                     Reserved : 0000
[030h 0048   4]         CPU Interface Number : 00000000
[034h 0052   4]                Processor UID : 00000000
[038h 0056   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
[03Ch 0060   4]     Parking Protocol Version : 00000000
[040h 0064   4]        Performance Interrupt : 00000017
[044h 0068   8]               Parked Address : 0000000000000000
[04Ch 0076   8]                 Base Address : 0000000000000000
[054h 0084   8]     Virtual GIC Base Address : 0000000000000000
[05Ch 0092   8]  Hypervisor GIC Base Address : 0000000000000000
[064h 0100   4]        Virtual GIC Interrupt : 00000000
[068h 0104   8]   Redistributor Base Address : 0000000000000000
[070h 0112   8]                    ARM MPIDR : 0000000000000000
[078h 0120   1]             Efficiency Class : 00
[079h 0121   1]                     Reserved : 00
[07Ah 0122   2]       SPE Overflow Interrupt : 0000

[07Ch 0124   1]                Subtable Type : 0B [Generic Interrupt Controller]
[07Dh 0125   1]                       Length : 50
[07Eh 0126   2]                     Reserved : 0000
[080h 0128   4]         CPU Interface Number : 00000000
[084h 0132   4]                Processor UID : 00000001
[088h 0136   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
[08Ch 0140   4]     Parking Protocol Version : 00000000
[090h 0144   4]        Performance Interrupt : 00000017
[094h 0148   8]               Parked Address : 0000000000000000
[09Ch 0156   8]                 Base Address : 0000000000000000
[0A4h 0164   8]     Virtual GIC Base Address : 0000000000000000
[0ACh 0172   8]  Hypervisor GIC Base Address : 0000000000000000
[0B4h 0180   4]        Virtual GIC Interrupt : 00000000
[0B8h 0184   8]   Redistributor Base Address : 0000000000000000
[0C0h 0192   8]                    ARM MPIDR : 0000000000000001
[0C8h 0200   1]             Efficiency Class : 00
[0C9h 0201   1]                     Reserved : 00
[0CAh 0202   2]       SPE Overflow Interrupt : 0000

[0CCh 0204   1]                Subtable Type : 0C [Generic Interrupt Distributor]
[0CDh 0205   1]                       Length : 18
[0CEh 0206   2]                     Reserved : 0000
[0D0h 0208   4]        Local GIC Hardware ID : 00000000
[0D4h 0212   8]                 Base Address : 000000002C010000
[0DCh 0220   4]               Interrupt Base : 00000000
[0E0h 0224   1]                      Version : 03
[0E1h 0225   3]                     Reserved : 000000

[0E4h 0228   1]                Subtable Type : 0E [Generic Interrupt Redistributor]
[0E5h 0229   1]                       Length : 10
[0E6h 0230   2]                     Reserved : 0000
[0E8h 0232   8]                 Base Address : 000000002C100000
[0F0h 0240   4]                       Length : 00040000

[0F4h 0244   1]                Subtable Type : 0D [Generic MSI Frame]
[0F5h 0245   1]                       Length : 18
[0F6h 0246   2]                     Reserved : 0000
[0F8h 0248   4]                 MSI Frame ID : 00000000
[0FCh 0252   8]                 Base Address : 000000002C080000
[104h 0260   4]        Flags (decoded below) : 00000000
                                  Select SPI : 0
[108h 0264   2]                    SPI Count : 0000
[10Ah 0266   2]                     SPI Base : 0000

Raw Table Data: Length 268 (0x10C)

    0000: 41 50 49 43 0C 01 00 00 04 38 56 4D 57 41 52 45  // APIC.....8VMWARE
    0010: 56 4D 57 56 42 53 41 21 21 12 20 20 56 4D 57 20  // VMWVBSA!!.  VMW 
    0020: 01 00 00 00 00 00 00 00 00 00 00 00 0B 50 00 00  // .............P..
    0030: 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  // ................
    0040: 17 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 0B 50 00 00  // .............P..
    0080: 00 00 00 00 01 00 00 00 01 00 00 00 00 00 00 00  // ................
    0090: 17 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00C0: 01 00 00 00 00 00 00 00 00 00 00 00 0C 18 00 00  // ................
    00D0: 00 00 00 00 00 00 01 2C 00 00 00 00 00 00 00 00  // .......,........
    00E0: 03 00 00 00 0E 10 00 00 00 00 10 2C 00 00 00 00  // ...........,....
    00F0: 00 00 04 00 0D 18 00 00 00 00 00 00 00 00 08 2C  // ...............,
    0100: 00 00 00 00 00 00 00 00 00 00 00 00              // ............
