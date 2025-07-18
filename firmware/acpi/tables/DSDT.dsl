/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of DSDT, Tue May 20 19:48:22 2025
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00000ED4 (3796)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0x4D
 *     OEM ID           "VMWARE"
 *     OEM Table ID     "VMWVBSA!"
 *     OEM Revision     0x01343F06 (20201222)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20130823 (538118179)
 */
DefinitionBlock ("", "DSDT", 1, "VMWARE", "VMWVBSA!", 0x01343F06)
{
    External (VCRB, IntObj)

    Scope (_SB)
    {
        OperationRegion (EREG, SystemMemory, 0x01000000, 0x0002C000)
        Device (COM1)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DDN, "COM1")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                OperationRegion (SPRT, SystemMemory, 0x01000480, 0x04)
                Field (SPRT, ByteAcc, NoLock, Preserve)
                {
                    STAV,   4
                }

                Return (STAV) /* \_SB_.COM1._STA.STAV */
            }

            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0x3FFF03F8,         // Address Base
                    0x00000008,         // Address Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                {
                    0x00000024,
                }
            })
            Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
            {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */, 
                Package (0x01)
                {
                    Package (0x02)
                    {
                        "clock-frequency", 
                        0x00384000
                    }
                }
            })
        }

        Device (COM2)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_DDN, "COM2")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                OperationRegion (SPRT, SystemMemory, 0x01000484, 0x04)
                Field (SPRT, ByteAcc, NoLock, Preserve)
                {
                    STAV,   4
                }

                Return (STAV) /* \_SB_.COM2._STA.STAV */
            }

            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0x3FFF02F8,         // Address Base
                    0x00000008,         // Address Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                {
                    0x00000025,
                }
            })
            Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
            {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */, 
                Package (0x01)
                {
                    Package (0x02)
                    {
                        "clock-frequency", 
                        0x00384000
                    }
                }
            })
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_SEG, Zero)  // _SEG: PCI Segment
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_ADR, Zero)  // _ADR: Address
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
            Method (_CBA, 0, NotSerialized)  // _CBA: Configuration Base Address
            {
                Return (0x40000000)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x00FF,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0100,             // Length
                        ,, )
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Granularity
                        0x30000000,         // Range Minimum
                        0x3FFEFFFF,         // Range Maximum
                        0x00000000,         // Translation Offset
                        0x0FFF0000,         // Length
                        ,, , AddressRangeMemory, TypeStatic)
                    QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x0000000000000000, // Granularity
                        0x0000000050000000, // Range Minimum
                        0x000000007FFFFFFF, // Range Maximum
                        0x0000000000000000, // Translation Offset
                        0x0000000030000000, // Length
                        ,, , AddressRangeMemory, TypeStatic)
                })
                Return (RBUF) /* \_SB_.PCI0._CRS.RBUF */
            }

            Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
            {
                Package (0x04)
                {
                    0xFFFF, 
                    Zero, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    One, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x02, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x03, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    0x02, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0003FFFF, 
                    0x03, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    Zero, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    One, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x02, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x03, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    Zero, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    One, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x02, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x03, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    Zero, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    One, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x02, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x02, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x03, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x03, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    Zero, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    One, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x02, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0009FFFF, 
                    0x03, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    Zero, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    One, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x02, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x03, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x02, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x03, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    Zero, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    One, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x02, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x03, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    Zero, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    One, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    0x02, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    0x03, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    Zero, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    One, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    0x02, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    0x03, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x000FFFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x000FFFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x000FFFFF, 
                    0x02, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x000FFFFF, 
                    0x03, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    Zero, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    One, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x02, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    0x03, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    Zero, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    One, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x02, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0011FFFF, 
                    0x03, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    Zero, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    One, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    0x02, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    0x03, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    0x02, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    0x03, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    Zero, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    One, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    0x02, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    0x03, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    Zero, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    One, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x02, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    0x03, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0017FFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0017FFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0017FFFF, 
                    0x02, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0017FFFF, 
                    0x03, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    Zero, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    One, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    0x02, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0018FFFF, 
                    0x03, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0019FFFF, 
                    Zero, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0019FFFF, 
                    One, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x0019FFFF, 
                    0x02, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0019FFFF, 
                    0x03, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    Zero, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    One, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    0x02, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x001AFFFF, 
                    0x03, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    0x02, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x001BFFFF, 
                    0x03, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    Zero, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    One, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x02, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x001CFFFF, 
                    0x03, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    Zero, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    One, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x02, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x001DFFFF, 
                    0x03, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x001EFFFF, 
                    Zero, 
                    Zero, 
                    0x23
                }, 

                Package (0x04)
                {
                    0x001EFFFF, 
                    One, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x001EFFFF, 
                    0x02, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x001EFFFF, 
                    0x03, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x02, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x001FFFFF, 
                    0x03, 
                    Zero, 
                    0x23
                }
            })
            Device (RES0)
            {
                Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                        0x0000000000000000, // Granularity
                        0x0000000040000000, // Range Minimum
                        0x000000004FFFFFFF, // Range Maximum
                        0x0000000000000000, // Translation Offset
                        0x0000000010000000, // Length
                        ,, , AddressRangeMemory, TypeStatic)
                })
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    CTRL &= 0x1D
                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x21                                             // !
                            })
                        }
                        Case (0x05)
                        {
                            If ((Arg1 >= One))
                            {
                                Return (Zero)
                            }
                        }
                        Default
                        {
                        }

                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }

        Field (EREG, AnyAcc, NoLock, Preserve)
        {
            Offset (0x460), 
            TBAS,   32, 
            TPRS,   32, 
            TPOP,   8, 
            TPRQ,   1, 
            Offset (0x46A), 
                ,   1, 
            TP17,   1, 
            TP26,   1, 
            TP28,   1, 
            TP30,   1, 
            TP32,   1, 
            TP98,   1, 
            T100,   1, 
            Offset (0x470), 
                ,   7, 
            TMIM,   1, 
            TMOR,   8
        }

        Device (VTPM)
        {
            Name (_HID, EisaId ("VMW0004"))  // _HID: Hardware ID
            Name (_CID, Package (0x02)  // _CID: Compatible ID
            {
                "MSFT0101" /* TPM 2.0 Security Device */, 
                "ACPI\\MSFT0101"
            })
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (TBAS)
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                If (VCRB)
                {
                    Name (TMPL, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00050000,         // Address Length
                            _Y01)
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00001000,         // Address Length
                            _Y00)
                    })
                    CreateDWordField (TMPL, \_SB.VTPM._CRS._Y00._BAS, CRBB)  // _BAS: Base Address
                    CRBB = VCRB /* External reference */
                    CreateDWordField (TMPL, \_SB.VTPM._CRS._Y01._BAS, BASE)  // _BAS: Base Address
                    BASE = TBAS /* \_SB_.TBAS */
                    Return (TMPL) /* \_SB_.VTPM._CRS.TMPL */
                }
                Else
                {
                    Name (TMP2, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00050000,         // Address Length
                            _Y02)
                    })
                    CreateDWordField (TMP2, \_SB.VTPM._CRS._Y02._BAS, BAS2)  // _BAS: Base Address
                    BAS2 = TBAS /* \_SB_.TBAS */
                    Return (TMP2) /* \_SB_.VTPM._CRS.TMP2 */
                }
            }

            OperationRegion (RTPM, SystemMemory, TBAS, 0x1000)
            Field (RTPM, DWordAcc, NoLock, Preserve)
            {
                Offset (0xFF0), 
                XCRB,   32
            }

            Method (PPCK, 1, NotSerialized)
            {
                If ((Ones == Match (Package (0x09)
                            {
                                Zero, 
                                0x11, 
                                0x1A, 
                                0x1C, 
                                0x1E, 
                                0x20, 
                                0x21, 
                                0x62, 
                                0x64
                            }, MEQ, Arg0, MTR, Zero, Zero)))
                {
                    If ((Ones != Match (Package (0x07)
                                    {
                                        0x12, 
                                        0x19, 
                                        0x1B, 
                                        0x1D, 
                                        0x1F, 
                                        0x63, 
                                        0x65
                                    }, MEQ, Arg0, MTR, Zero, Zero)))
                    {
                        Return (0x03)
                    }

                    If ((Arg0 == One))
                    {
                        Local0 = TP28 /* \_SB_.TP28 */
                        Return (Zero)
                    }
                    ElseIf ((Arg0 == 0x02))
                    {
                        Local0 = TP30 /* \_SB_.TP30 */
                        Return (Zero)
                    }
                    ElseIf ((Arg0 == 0x05))
                    {
                        Local0 = TP17 /* \_SB_.TP17 */
                    }
                    ElseIf ((Arg0 == 0x17))
                    {
                        Local0 = TP26 /* \_SB_.TP26 */
                        Return (Zero)
                    }
                    ElseIf ((Arg0 == 0x18))
                    {
                        Local0 = TP32 /* \_SB_.TP32 */
                        Return (Zero)
                    }
                    ElseIf ((Arg0 == 0x22))
                    {
                        Local0 = (TP28 | TP30) /* \_SB_.TP30 */
                        Return (Zero)
                    }
                    ElseIf ((Arg0 == 0x60))
                    {
                        Local0 = TP98 /* \_SB_.TP98 */
                        Return (Zero)
                    }
                    ElseIf ((Arg0 == 0x61))
                    {
                        Local0 = T100 /* \_SB_.T100 */
                        Return (Zero)
                    }
                    ElseIf ((Ones == Match (Package (0x03)
                                {
                                    0x0E, 
                                    0x15, 
                                    0x16
                                }, MEQ, Arg0, MTR, Zero, Zero)))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Local0 = (TP17 | TP28) /* \_SB_.TP28 */
                    }

                    If (Local0)
                    {
                        Return (0x03)
                    }
                }

                Return (0x04)
            }

            Method (PPEX, 2, Serialized)
            {
                Local0 = PPCK (Arg0)
                If ((Local0 < 0x03))
                {
                    If ((Arg0 != 0x0A))
                    {
                        Return (One)
                    }
                }

                TPRS = Arg1
                TPOP = Arg0
                TPRQ = One
                Return (Zero)
            }

            Name (RSTA, One)
            Method (RCMD, 0, Serialized)
            {
                If (RSTA)
                {
                    OperationRegion (RCRB, SystemMemory, VCRB, 0x80)
                    Field (RCRB, DWordAcc, NoLock, Preserve)
                    {
                        Offset (0x08), 
                        LCTR,   32, 
                        Offset (0x40), 
                        CTRQ,   32, 
                        Offset (0x48), 
                        CNCL,   32, 
                        CSTR,   32
                    }

                    Local0 = ((LCTR || CTRQ) | (CNCL || CSTR))
                    If ((RSTA == One))
                    {
                        If (Local0)
                        {
                            RSTA = Zero
                        }
                        Else
                        {
                            RSTA = 0x02
                        }
                    }

                    If (!Local0)
                    {
                        CSTR = One
                    }
                }

                XCRB = (VCRB + 0x40)
            }

            Name (BSAV, One)
            Name (BPOP, Zero)
            Name (BPRS, Zero)
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("cf8e16a5-c1e8-4e25-b712-4f54a96702c8") /* Unknown UUID */))
                {
                    If ((Arg1 >= One))
                    {
                        If ((Zero == Arg2))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        If ((Arg2 == One))
                        {
                            Return (Package (0x02)
                            {
                                One, 
                                Package (0x02)
                                {
                                    0x02, 
                                    Zero
                                }
                            })
                        }

                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }

                If ((Arg0 == ToUUID ("3dddfaa6-361b-4eb4-a424-8d10089d1653") /* Physical Presence Interface */))
                {
                    If ((Arg1 >= One))
                    {
                        If (BSAV)
                        {
                            BPOP = TPOP /* \_SB_.TPOP */
                            BPRS = TPRS /* \_SB_.TPRS */
                            BSAV = Zero
                            TPRS = Zero
                            TPOP = Zero
                        }

                        If ((Zero == Arg2))
                        {
                            Return (Buffer (0x02)
                            {
                                 0xFF, 0x01                                       // ..
                            })
                        }

                        If ((One == Arg2))
                        {
                            Return ("1.3")
                        }

                        If ((0x02 == Arg2))
                        {
                            Return (PPEX (DerefOf (Arg3 [Zero]), Zero))
                        }

                        If ((0x03 == Arg2))
                        {
                            If ((Arg1 >= 0x02))
                            {
                                Local0 = Package (0x03)
                                    {
                                        Zero, 
                                        Zero, 
                                        Zero
                                    }
                                Local0 [0x02] = TPRS /* \_SB_.TPRS */
                            }
                            Else
                            {
                                Local0 = Package (0x02)
                                    {
                                        Zero, 
                                        Zero
                                    }
                            }

                            Local0 [One] = TPOP /* \_SB_.TPOP */
                            Return (Local0)
                        }

                        If ((0x04 == Arg2))
                        {
                            Return (0x02)
                        }

                        If ((0x05 == Arg2))
                        {
                            Local0 = Package (0x03)
                                {
                                    Zero, 
                                    Zero, 
                                    Zero
                                }
                            Local0 [One] = BPOP /* \_SB_.VTPM.BPOP */
                            Local0 [0x02] = BPRS /* \_SB_.VTPM.BPRS */
                            Return (Local0)
                        }

                        If ((0x06 == Arg2))
                        {
                            Return (0x03)
                        }

                        If ((0x07 == Arg2))
                        {
                            If ((Arg1 >= 0x02))
                            {
                                Local1 = DerefOf (Arg3 [One])
                            }
                            Else
                            {
                                Local1 = Zero
                            }

                            Return (PPEX (DerefOf (Arg3 [Zero]), Local1))
                        }

                        If ((0x08 == Arg2))
                        {
                            Local0 = DerefOf (Arg3 [Zero])
                            Return (PPCK (DerefOf (Arg3 [Zero])))
                        }

                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }

                If (((Arg0 == ToUUID ("376054ed-cc13-4675-901c-4756d7f2d45d") /* Unknown UUID */) && TMIM))
                {
                    If ((Arg1 >= One))
                    {
                        If ((Zero == Arg2))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        If ((Arg2 == One))
                        {
                            TMOR = DerefOf (Arg3 [Zero])
                            Return (Zero)
                        }

                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }

                If (((Arg0 == ToUUID ("6bbf6cab-5463-4714-b7cd-f0203c0368d4") /* Unknown UUID */) && VCRB))
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    If ((Arg2 == One))
                    {
                        RCMD ()
                        Return (Zero)
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }
}

