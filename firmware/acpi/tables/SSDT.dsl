/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT, Tue May 20 19:49:15 2025
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000073 (115)
 *     Revision         0x02
 *     Checksum         0xCE
 *     OEM ID           "VMWARE"
 *     OEM Table ID     "VMWVBSA!"
 *     OEM Revision     0x20201221 (538972705)
 *     Compiler ID      "VMW "
 *     Compiler Version 0x00000001 (1)
 */
DefinitionBlock ("", "SSDT", 2, "VMWARE", "VMWVBSA!", 0x20201221)
{
    Scope (_SB)
    {
        Device (C000)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, 0x0000)  // _UID: Unique ID
        }

        Device (C001)
        {
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, 0x0001)  // _UID: Unique ID
        }

        Name (VCRB, 0x00000000)
        Noop
        Noop
    }
}

