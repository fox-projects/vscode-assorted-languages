DefinitionBlock ("", "DSDT", 2, "", "", 0x0)
{
	Scope (\_SB)
	{
		Device (PCI0)
		{
			Name (INT1, 0x1234)
			Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)
			Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)
			Method (^BN00, 0, NotSerialized)
			{
				Return (0x12 + INT1)
			}
			Method (_BBN, 0, NotSerialized)
			{
				Return (BN00 ())
			}
			Name (_UID, 0x00) // _UID: Unique ID
			OperationRegion (MCHT, SystemMemory, 0xFED10000, 0x6000)
			Field (MCHT, ByteAcc, NoLock, Preserve)
			{
				Offset (0x5994),
				RPSL, 8,
				Offset (0x5998),
				RP0C, 8,
				RP1C, 8,
				RPNC, 8
			}
		}
	}
}
