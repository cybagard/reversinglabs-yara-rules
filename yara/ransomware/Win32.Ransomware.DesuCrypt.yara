rule Win32_Ransomware_DesuCrypt : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        description         = "Yara rule that detects DesuCrypt ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "DesuCrypt"
        tc_detection_factor = 5

    strings:

        $find_files = {
            8B FF 55 8B EC 51 8B 4D ?? 8D 51 ?? 8A 01 41 84 C0 75 ?? 57 8B 7D ?? 2B CA 8B C7 41 
            F7 D0 89 4D ?? 3B C8 76 ?? 6A ?? 58 EB ?? 53 56 8D 5F ?? 03 D9 6A ?? 53 E8 ?? ?? ?? 
            ?? 8B F0 59 59 85 FF 74 ?? 57 FF 75 ?? 53 56 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 75 ?? FF 
            75 ?? 2B DF 8D 04 3E FF 75 ?? 53 50 E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 75 ?? 8B 5D ?? 8B 
            CB E8 ?? ?? ?? ?? 33 FF 89 45 ?? 85 C0 74 ?? 56 E8 ?? ?? ?? ?? 8B 75 ?? 59 EB ?? 8B 
            43 ?? 89 30 8B F7 83 43 ?? ?? 57 E8 ?? ?? ?? ?? 59 8B C6 5E 5B 5F 8B E5 5D C3 33 FF 
            57 57 57 57 57 E8 ?? ?? ?? ?? CC 8B FF 55 8B EC 81 EC ?? ?? ?? ?? A1 ?? ?? ?? ?? 33 
            C5 89 45 ?? 8B 4D ?? 53 8B 5D ?? 57 8B 7D ?? 89 9D ?? ?? ?? ?? EB ?? 8A 01 3C ?? 74 
            ?? 3C ?? 74 ?? 3C ?? 74 ?? 51 57 E8 ?? ?? ?? ?? 59 59 8B C8 3B CF 75 ?? 8A 11 80 FA 
            ?? 75 ?? 8D 47 ?? 3B C8 74 ?? 53 33 DB 53 53 57 E8 ?? ?? ?? ?? 83 C4 ?? EB ?? 33 DB 
            80 FA ?? 74 ?? 80 FA ?? 74 ?? 8A C3 80 FA ?? 75 ?? B0 ?? 0F B6 C0 2B CF 41 F7 D8 56 
            1B C0 23 C1 68 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 53 50 E8 ?? ?? ?? ?? 
            83 C4 ?? 8D 85 ?? ?? ?? ?? 53 53 53 50 53 57 FF 15 ?? ?? ?? ?? 8B F0 8B 85 ?? ?? ?? 
            ?? 83 FE ?? 75 ?? 50 53 53 57 E8 ?? ?? ?? ?? 83 C4 ?? 8B D8 83 FE ?? 74 ?? 56 FF 15 
            ?? ?? ?? ?? 8B C3 5E 8B 4D ?? 5F 33 CD 5B E8 ?? ?? ?? ?? 8B E5 5D C3 8B 48 ?? 2B 08 
            C1 F9 ?? 89 8D ?? ?? ?? ?? 80 BD ?? ?? ?? ?? ?? 75 ?? 8A 8D ?? ?? ?? ?? 84 C9 74 ?? 
            80 F9 ?? 75 ?? 38 9D ?? ?? ?? ?? 74 ?? 50 FF B5 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 57 50 
            E8 ?? ?? ?? ?? 83 C4 ?? 85 C0 75 ?? 8D 85 ?? ?? ?? ?? 50 56 FF 15 ?? ?? ?? ?? 85 C0 
            8B 85 ?? ?? ?? ?? 75 ?? 8B 10 8B 40 ?? 8B 8D ?? ?? ?? ?? 2B C2 C1 F8 ?? 3B C8 0F 84 
            ?? ?? ?? ?? 68 ?? ?? ?? ?? 2B C1 6A ?? 50 8D 04 8A 50 E8 ?? ?? ?? ?? 83 C4 ?? E9
        }

        $encrypt_files = {
            55 8B EC 83 E4 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? A1 ?? ?? ?? ?? 33 C4 89 84 24 ?? ?? 
            ?? ?? 53 56 57 8B D9 89 54 24 ?? B9 ?? ?? ?? ?? C7 44 24 ?? ?? ?? ?? ?? BE ?? ?? ?? 
            ?? C7 44 24 ?? ?? ?? ?? ?? 8D 7C 24 ?? C7 44 24 ?? ?? ?? ?? ?? F3 A5 6A ?? 6A ?? 8D 
            44 24 ?? 50 8D 84 24 ?? ?? ?? ?? 66 A5 50 6A ?? 6A ?? 8D 44 24 ?? 50 FF 15 ?? ?? ?? 
            ?? 85 C0 75 ?? FF 15 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 83 C4 ?? 50 
            E8 ?? ?? ?? ?? 83 C4 ?? 33 C0 5F 5E 5B 8B 8C 24 ?? ?? ?? ?? 33 CC E8 ?? ?? ?? ?? 8B 
            E5 5D C3 8D 44 24 ?? 50 8D 44 24 ?? 50 6A ?? 68 ?? ?? ?? ?? FF 74 24 ?? 8D 84 24 ?? 
            ?? ?? ?? 50 6A ?? 6A ?? FF 15 ?? ?? ?? ?? 85 C0 75 ?? FF 15 ?? ?? ?? ?? 50 68 ?? ?? 
            ?? ?? EB ?? 68 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 6A ?? 8D 44 24 ?? 50 FF 15 ?? ?? ?? 
            ?? 85 C0 75 ?? FF 15 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 33 C0 5F 
            5E 5B 8B 8C 24 ?? ?? ?? ?? 33 CC E8 ?? ?? ?? ?? 8B E5 5D C3 8D 44 24 ?? 50 FF 74 24 
            ?? 6A ?? FF 74 24 ?? FF 15 ?? ?? ?? ?? 85 C0 75 ?? FF 15 ?? ?? ?? ?? 50 68 ?? ?? ?? 
            ?? E9 ?? ?? ?? ?? 8B 43 ?? 8B 3D ?? ?? ?? ?? 50 89 44 24 ?? 89 44 24 ?? 8D 44 24 ?? 
            50 6A ?? 6A ?? 6A ?? 6A ?? FF 74 24 ?? FF D7 85 C0 75 ?? FF 15 ?? ?? ?? ?? 50 51 BA 
            ?? ?? ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 8B C8 E8 ?? ?? ?? ?? 50 E8 ?? ?? 
            ?? ?? 83 C4 ?? 33 C0 5F 5E 5B 8B 8C 24 ?? ?? ?? ?? 33 CC E8 ?? ?? ?? ?? 8B E5 5D C3 
            FF 74 24 ?? E8 ?? ?? ?? ?? 83 C4 ?? 8B F0 FF 74 24 ?? 6A ?? 56 E8 ?? ?? ?? ?? 83 C4 
            ?? 83 7B ?? ?? 72 ?? 8B 1B FF 74 24 ?? 53 56 E8 ?? ?? ?? ?? 83 C4 ?? 8D 44 24 ?? FF 
            74 24 ?? 50 56 6A ?? 6A ?? 6A ?? FF 74 24 ?? FF D7 85 C0 0F 84 ?? ?? ?? ?? 8B 4C 24 
            ?? 8B 44 24 ?? 5F 89 01 8B C6 8B 8C 24 ?? ?? ?? ?? 5E 5B 33 CC E8 ?? ?? ?? ?? 8B E5 
            5D C3 
        }

        $enum_shares = {
            55 8B EC 6A ?? 68 ?? ?? ?? ?? 64 A1 ?? ?? ?? ?? 50 83 EC ?? A1 ?? ?? ?? ?? 33 C5 89 
            45 ?? 53 56 57 50 8D 45 ?? 64 A3 ?? ?? ?? ?? 8B F1 89 75 ?? 8B 45 ?? 8D 4D ?? 51 50 
            6A ?? 6A ?? 6A ?? C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 85 C0 
            0F 85 ?? ?? ?? ?? FF 75 ?? 6A ?? FF 15 ?? ?? ?? ?? 8B F8 89 7D ?? 85 FF 0F 84 ?? ?? 
            ?? ?? 8D 45 ?? 50 57 8D 45 ?? 50 FF 75 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? 
            0F 1F 40 ?? 33 DB 39 5D ?? 0F 8E ?? ?? ?? ?? 83 C7 ?? 66 90 F7 47 ?? ?? ?? ?? ?? 74 
            ?? 8D 47 ?? 89 45 ?? 8B 06 8B 48 ?? 85 C9 0F 84 ?? ?? ?? ?? 8B 01 8D 55 ?? 52 FF 50 
            ?? E9 ?? ?? ?? ?? 8B 17 33 C0 66 89 45 ?? 8B C2 C7 45 ?? ?? ?? ?? ?? C7 45 ?? ?? ?? 
            ?? ?? 8D 70 ?? 66 8B 08 83 C0 ?? 66 85 C9 75 ?? 2B C6 D1 F8 83 F8 ?? 77 ?? 8D 34 00 
            89 45 ?? 56 52 8D 45 ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 33 C0 66 89 44 35 ?? EB ?? 52 C6 
            45 ?? ?? 8D 4D ?? FF 75 ?? 50 E8 ?? ?? ?? ?? 8B 75 ?? 8D 45 ?? C7 45 ?? ?? ?? ?? ?? 
            50 8B 4E ?? E8 ?? ?? ?? ?? 8D 4D ?? C7 45 ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 43 83 C7 ?? 
            3B 5D ?? 0F 8C ?? ?? ?? ?? 8B 7D ?? 8D 45 ?? C7 45 ?? ?? ?? ?? ?? 50 57 8D 45 ?? C7 
            45 ?? ?? ?? ?? ?? 50 FF 75 ?? FF 15 ?? ?? ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 57 FF 15 ?? 
            ?? ?? ?? FF 75 ?? FF 15 ?? ?? ?? ?? 8B 4D ?? 64 89 0D ?? ?? ?? ?? 59 5F 5E 5B 8B 4D 
            ?? 33 CD E8 ?? ?? ?? ?? 8B E5 5D C2
        }

    condition:
        uint16(0) == 0x5A4D and 
        (
            $find_files and 
            $encrypt_files and 
            $enum_shares
        )
}