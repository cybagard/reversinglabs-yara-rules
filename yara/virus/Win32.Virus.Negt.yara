import "pe"

rule Win32_Virus_Negt : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        description         = "Yara rule that detects Negt virus."

        tc_detection_type   = "Virus"
        tc_detection_name   = "Negt"
        tc_detection_factor = 5

    strings:
        $negt_body_and_infector_1 = {
            6A 00 E8 99 08 00 00 A3 ?? ?? ?? ?? 68 04 01 00 00 68 ?? ?? ?? ?? 6A 00 E8 7D 08 00 00 6A 00 68 ?? ?? ?? ?? 68 ?? ?? ??
            ?? E8 48 08 00 00 BB 00 00 00 00 8D 05 ?? ?? ?? ?? FE 00 68 ?? ?? ?? ?? E8 2D 00 00 00 43 83 FB 18 7C E8 E8 92 08 00 00
            3C 9F 7F 17 6A 01 68 ?? ?? ?? ?? 6A 00 68 ?? ?? ?? ?? 6A 00 6A 00 E8 7D 08 00 00 6A 00 E8 10 08 00 00 55 8B EC 81 C4 B8
            FD FF FF FF 75 08 E8 35 08 00 00 0B C0 0F 84 C2 00 00 00 8D 85 C2 FE FF FF 50 68 ?? ?? ?? ?? E8 F2 07 00 00 89 85 BC FE
            FF FF 83 BD BC FE FF FF FF 0F 84 9E 00 00 00 8D 9D EE FE FF FF 53 E8 21 08 00 00 8B F3 BB 00 00 00 00 F7 D3 68 ?? ?? ??
            ?? 56 E8 01 08 00 00 23 D8 68 ?? ?? ?? ?? 56 E8 F4 07 00 00 23 D8 68 ?? ?? ?? ?? 56 E8 E7 07 00 00 23 D8 68 ?? ?? ?? ??
            56 E8 DA 07 00 00 23 D8 68 ?? ?? ?? ?? 56 E8 CD 07 00 00 23 D8 83 FB 00 74 28 FF 75 08 68 ?? ?? ?? ?? E8 BF 07 00 00 8D
            85 EE FE FF FF 50 68 ?? ?? ?? ?? E8 A2 07 00 00 68 ?? ?? ?? ?? E8 08 01 00 00 8D 85 C2 FE FF FF 50 FF B5 BC FE FF FF E8
            50 07 00 00 83 F8 00 0F 85 62 FF FF FF FF B5 BC FE FF FF E8 30 07 00 00 8D 85 C2 FE FF FF 50 68 ?? ?? ?? ?? E8 25 07 00
            00 89 85 BC FE FF FF 83 BD BC FE FF FF FF 0F 84 AF 00 00 00 8D BD C2 FE FF FF 8B 07 66 83 E0 10 0F 84 82 00 00 00 8D 9D
        }

        $negt_body_and_infector_2 = {
            EE FE FF FF 53 E8 42 07 00 00 8B F3 BB 00 00 00 00 F7 D3 68 ?? ?? ?? ?? 56 E8 22 07 00 00 23 D8 68 ?? ?? ?? ?? 56 E8 15
            07 00 00 23 D8 68 ?? ?? ?? ?? 56 E8 08 07 00 00 23 D8 83 FB 00 74 41 FF 75 08 8D 85 B8 FD FF FF 50 E8 F8 06 00 00 8D 85
            EE FE FF FF 50 8D 85 B8 FD FF FF 50 E8 D9 06 00 00 68 ?? ?? ?? ?? 8D 85 B8 FD FF FF 50 E8 C8 06 00 00 60 8D 85 B8 FD FF
            FF 50 E8 63 FE FF FF 61 8D 85 C2 FE FF FF 50 FF B5 BC FE FF FF E8 72 06 00 00 83 F8 00 0F 85 51 FF FF FF FF B5 BC FE FF
            FF E8 52 06 00 00 C9 C2 04 00 55 8B EC 81 C4 E4 E9 FF FF 51 6A 00 68 80 00 00 00 6A 03 6A 00 6A 03 68 00 00 00 C0 FF 75
            08 E8 1E 06 00 00 83 F8 FF 75 05 E9 AE 03 00 00 89 45 FC 6A 00 6A 00 6A 3C FF 75 FC E8 45 06 00 00 6A 00 8D 45 F0 50 6A
            04 8D 45 F4 50 FF 75 FC E8 25 06 00 00 6A 00 6A 00 FF 75 F4 FF 75 FC E8 22 06 00 00 6A 00 8D 45 F0 50 68 20 01 00 00 68
            ?? ?? ?? ?? FF 75 FC E8 FE 05 00 00 8B 5D F4 83 EB 0B 6A 00 6A 00 53 FF 75 FC E8 F7 05 00 00 6A 00 8D 45 F0 50 6A 0B 68
            ?? ?? ?? ?? FF 75 FC E8 D6 05 00 00 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? E8 E5 05 00 00 0B C0 75 05 E9 12 03 00 00 81 3D ?? ??
            ?? ?? 50 45 00 00 74 05 E9 01 03 00 00 0F B7 05 ?? ?? ?? ?? B9 28 00 00 00 F7 E1 03 45 F4 83 C0 18 0F B7 0D ?? ?? ?? ??
            03 C1 83 C0 28 3B 05 ?? ?? ?? ?? 76 05 E9 D4 02 00 00 A1 ?? ?? ?? ?? A3 ?? ?? ?? ?? A1 ?? ?? ?? ?? A3 ?? ?? ?? ?? 0F B7
        }

        $negt_body_and_infector_3 = {
            05 ?? ?? ?? ?? B9 28 00 00 00 F7 E1 83 C0 04 03 45 F4 83 C0 14 05 E0 00 00 00 89 45 EC C7 05 ?? ?? ?? ?? 2E 45 41 54 C7
            05 ?? ?? ?? ?? 55 02 00 00 FF 35 ?? ?? ?? ?? 8F 05 ?? ?? ?? ?? A1 ?? ?? ?? ?? 8B 0D ?? ?? ?? ?? 99 F7 F1 40 F7 E1 A3 ??
            ?? ?? ?? 8B 45 EC 83 E8 18 6A 00 6A 00 50 FF 75 FC E8 10 05 00 00 6A 00 8D 45 F0 50 6A 04 8D 45 E8 50 FF 75 FC E8 F0 04
            00 00 6A 00 8D 45 F0 50 6A 04 8D 45 E4 50 FF 75 FC E8 DC 04 00 00 8B 45 E8 03 45 E4 A3 ?? ?? ?? ?? C7 05 ?? ?? ?? ?? 00
            00 00 00 C7 05 ?? ?? ?? ?? 00 00 00 00 66 C7 05 ?? ?? ?? ?? 00 00 66 C7 05 ?? ?? ?? ?? 00 00 C7 05 ?? ?? ?? ?? 20 00 00
            E0 6A 00 6A 00 FF 75 EC FF 75 FC E8 9E 04 00 00 6A 00 8D 45 F0 50 6A 28 68 ?? ?? ?? ?? FF 75 FC E8 8F 04 00 00 68 ?? ??
            ?? ?? E8 61 04 00 00 68 ?? ?? ?? ?? E8 63 04 00 00 A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8 48 04 00 00 A3 ??
            ?? ?? ?? 68 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8 33 04 00 00 A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8 1E 04 00 00
            A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8 09 04 00 00 A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8 F4 03
            00 00 A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8 DF 03 00 00 A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8
            CA 03 00 00 A3 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? E8 B5 03 00 00 A3 ?? ?? ?? ?? 6A 02 6A 00 6A 00 FF 75 FC E8
            BA 03 00 00 6A 00 8D 45 F0 50 FF 35 ?? ?? ?? ?? 8D 05 ?? ?? ?? ?? 50 FF 75 FC E8 A5 03 00 00 66 FF 05 ?? ?? ?? ?? A1 ??
            ?? ?? ?? 8B 0D ?? ?? ?? ?? 99 F7 F1 40 F7 E1 03 05 ?? ?? ?? ?? A3 ?? ?? ?? ?? A1 ?? ?? ?? ?? A3 ?? ?? ?? ?? 6A 00 6A 00
        }

        $negt_body_and_infector_4 = {
            FF 75 F4 FF 75 FC E8 63 03 00 00 6A 00 8D 45 F0 50 68 F8 00 00 00 68 ?? ?? ?? ?? FF 75 FC E8 51 03 00 00 83 6D F4 0B 6A
            00 6A 00 FF 75 F4 FF 75 FC E8 38 03 00 00 6A 00 8D 45 F0 50 6A 0B 68 ?? ?? ?? ?? FF 75 FC E8 29 03 00 00 6A 00 6A 20 6A
            03 6A 00 6A 01 68 00 00 00 80 68 ?? ?? ?? ?? E8 C8 02 00 00 89 45 F8 6A 00 6A 00 6A 00 FF 75 F8 E8 F9 02 00 00 6A 00 8D
            45 F0 50 68 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 50 FF 75 F8 E8 D3 02 00 00 8B 75 F0 6A 02 6A 00 6A 00 FF 75 FC E8 CE 02 00 00
            6A 00 8D 45 F0 50 56 8D 85 ?? ?? ?? ?? 50 FF 75 FC E8 BE 02 00 00 FF 75 FC E8 62 02 00 00 FF 75 F8 E8 5A 02 00 00 59 C9
            C2 04 00 E8 00 00 00 00 5D 81 ED ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 68 00 01 00 00 FF B5 ?? ?? ?? ?? 6A 00
            FF 95 ?? ?? ?? ?? 6A 00 6A 20 6A 03 6A 00 6A 01 68 00 00 00 80 FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 6A
            00 6A 20 6A 02 6A 00 6A 03 68 00 00 00 C0 8D 85 ?? ?? ?? ?? 50 FF 95 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 6A 00 FF B5 ?? ?? ??
            ?? FF 95 ?? ?? ?? ?? 2D ?? ?? ?? ?? 6A 00 6A 00 50 FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? 6A 00 8D 85 ?? ?? ?? ?? 50 68 00
            01 00 00 FF B5 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? 8B 9D ?? ?? ?? ?? 83 FB 00 74 1E 8D 85 ?? ?? ?? ?? 6A 00
            50 53 FF B5 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? EB B7 FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? FF B5 ?? ?? ?? ??
            FF 95 ?? ?? ?? ?? 6A 00 8D 85 ?? ?? ?? ?? 50 FF 95 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 03 85 ?? ?? ?? ?? 50 C3
        }

        $negt_infector = {
            E8 00 00 00 00 5D 81 ED ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 68 00 01 00 00 FF B5 ?? ?? ?? ?? 6A 00 FF 95 ??
            ?? ?? ?? 6A 00 6A 20 6A 03 6A 00 6A 01 68 00 00 00 80 FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 6A 00 6A 20
            6A 02 6A 00 6A 03 68 00 00 00 C0 8D 85 ?? ?? ?? ?? 50 FF 95 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 6A 00 FF B5 ?? ?? ?? ?? FF 95
            ?? ?? ?? ?? 2D ?? ?? ?? ?? 6A 00 6A 00 50 FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? 6A 00 8D 85 ?? ?? ?? ?? 50 68 00 01 00 00
            FF B5 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? 8B 9D ?? ?? ?? ?? 83 FB 00 74 1E 8D 85 ?? ?? ?? ?? 6A 00 50 53 FF
            B5 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? EB B7 FF B5 ?? ?? ?? ?? FF 95 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? FF 95 ??
            ?? ?? ?? 6A 00 8D 85 ?? ?? ?? ?? 50 FF 95 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 03 85 ?? ?? ?? ?? 50 C3
        }

    condition:
        uint16(0) == 0x5A4D and 
        (($negt_infector at pe.entry_point) or
        (($negt_body_and_infector_1 at pe.entry_point) and $negt_body_and_infector_2 and
        $negt_body_and_infector_3 and $negt_body_and_infector_4))
}