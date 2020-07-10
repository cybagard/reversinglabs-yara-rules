import "pe"

rule Win32_Virus_Cmay : tc_detection malicious
{ 
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        description         = "Yara rule that detects Cmay virus."

        tc_detection_type   = "Virus"
        tc_detection_name   = "Cmay"
        tc_detection_factor = 5

    strings:
        $cmay_body_1 = { 
            60 66 9C E8 00 00 00 00 5D 8B C5 81 ED ?? ?? ?? ?? 2D 08 00 00 00 2D
            ?? ?? ?? ?? 89 85 ?? ?? ?? ?? E8 3A 02 00 00 0F 82 7C 03 00 00 8D B5
            ?? ?? ?? ?? 8D BD ?? ?? ?? ?? E8 4F 02 00 00 E8 05 00 00 00 E9 61 03 
            00 00 8D BD ?? ?? ?? ?? C6 85 ?? ?? ?? ?? 03 6A 7F 57 FF 95 ?? ?? ?? 
            ?? 83 C7 7F 6A 7F 57 FF 95 ?? ?? ?? ?? 83 C7 7F 57 6A 7F FF 95 ?? ?? 
            ?? ?? 8D BD ?? ?? ?? ?? 80 BD ?? ?? ?? ?? 00 0F 84 20 03 00 00 FE 8D 
            ?? ?? ?? ?? 57 FF 95 ?? ?? ?? ?? 83 C7 7F 8D 9D ?? ?? ?? ?? 53 8D 9D
            ?? ?? ?? ?? 53 FF 95 ?? ?? ?? ?? 83 F8 FF 74 CA 89 85 ?? ?? ?? ?? FF 
            85 ?? ?? ?? ?? E8 C0 02 00 00 83 F8 FF 74 75 E8 70 02 00 00 85 C0 74 
            6C 8B 85 ?? ?? ?? ?? 8B 50 3C 3B 95 ?? ?? ?? ?? 73 5B 03 D0 8B 02 35 
            96 23 00 00 3D C6 66 00 00 75 4B 81 7A 4C 53 54 30 00 74 42 52 FF B5 
            ?? ?? ?? ?? FF 95 ?? ?? ?? ?? 5A FF B5 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? 
            E8 79 00 00 00 8F 85 ?? ?? ?? ?? 8F 85 ?? ?? ?? ?? 83 BD ?? ?? ?? ?? 
            05 7E 0E 80 BD ?? ?? ?? ?? 00 0F 85 40 FF FF FF C3 57 8D BD ?? ?? ?? 
            ?? B9 04 01 00 00 32 C0 F3 AA 5F FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? 
            FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? 
            ?? 8D 9D ?? ?? ?? ?? 53 FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? 85 C0 74 
            05 E9 2A FF FF FF E9 E9 FE FF FF 8B B5 ?? ?? ?? ?? 81 C6 ?? ?? ?? ?? 
            8B 5A 3C E8 87 01 00 00 89 B5 ?? ?? ?? ?? E8 8B 01 00 00 33 DB 8B 95 
            ?? ?? ?? ?? 8B 42 3C 03 D0 0F B7 42 06 48 6B C0 28 0F B7 5A 14 83 C3 
            18 03 DA 03 C3 8B 58 10 03 58 14 03 9D ?? ?? ?? ?? 53 8B 4A 28 89 8D 
            ?? ?? ?? ?? 8B 4A 34 89 8D ?? ?? ?? ?? 8B 48 0C 03 48 10 89 8D ?? ?? 
            ?? ?? 89 4A 28 8B 70 10 81 C6 ?? ?? ?? ?? 8B 5A 3C E8 1D 01 00 00 89 
            70 10 89 70 08 03 70 0C 89 72 50 81 48 24 20 00 00 A0 C7 42 4C 53 54
        }

        $cmay_body_2 = { 
            30 00 5B B9 ?? ?? ?? ?? FC 8B FB 8D B5 ?? ?? ?? ?? F3 A4 FF B5 ?? ?? 
            ?? ?? FF 95 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? FF B5 ?? 
            ?? ?? ?? FF 95 ?? ?? ?? ?? C3 50 51 B9 05 00 00 00 8B 44 24 2E 25 00
            00 FF FF 66 81 38 4D 5A 74 09 2D 00 00 01 00 E2 F2 EB 06 89 85 ?? ?? 
            ?? ?? 59 58 74 01 F9 C3 56 8B 95 ?? ?? ?? ?? 8B 72 3C 03 F2 8B 76 78 
            03 F2 83 C6 1C AD 03 C2 89 85 ?? ?? ?? ?? AD 03 C2 89 85 ?? ?? ?? ?? 
            AD 03 C2 89 85 ?? ?? ?? ?? 5E 57 E8 16 00 00 00 5F 89 07 83 C7 04 80 
            3E 88 C7 85 ?? ?? ?? ?? 00 00 00 00 75 E5 C3 8B DE 80 3E 00 74 03 46 
            EB F8 46 8B CE 2B CB 8B F3 8B BD ?? ?? ?? ?? 57 8B 3F 03 FA 51 F3 A6 
            74 0F 8B F3 59 5F 83 C7 04 FF 85 ?? ?? ?? ?? EB E7 59 5F 8B 85 ?? ?? 
            ?? ?? D1 E0 03 85 ?? ?? ?? ?? 33 DB 66 8B 18 C1 E3 02 03 9D ?? ?? ?? 
            ?? 8B 1B 03 DA 8B C3 C3 50 52 33 D2 8B C6 F7 F3 2B DA 03 F3 5A 58 C3 
            8B 85 ?? ?? ?? ?? 6A 00 50 6A 00 6A 04 6A 00 FF B5 ?? ?? ?? ?? FF 95 
            ?? ?? ?? ?? 85 C0 74 1E 89 85 ?? ?? ?? ?? 6A 00 6A 00 6A 00 6A 02 FF
            B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? 85 C0 75 02 33 C0 89 85 ?? ?? ?? ?? 
            C3 33 C0 50 68 80 00 00 00 6A 03 50 40 50 68 00 00 00 C0 8D B5 ?? ?? 
            ?? ?? 56 FF 95 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? C3 85 ED 0F 84 2A 04 00 
            00 33 C0 05 ?? ?? ?? ?? 05 ?? ?? ?? ?? FF E0
        } 
        
        condition: 
            uint16(0) == 0x5A4D and 
            ($cmay_body_1 at pe.entry_point) and
            $cmay_body_2
}