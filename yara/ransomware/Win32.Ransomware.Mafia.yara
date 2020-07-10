rule Win32_Ransomware_Mafia : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        description         = "Yara rule that detects Mafia ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "Mafia"
        tc_detection_factor = 5

    strings:

        $find_files = {
            55 8B EC 83 E4 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? A1 ?? ?? ?? ?? 33 C4 89 84 24 ?? ?? 
            ?? ?? 53 56 57 68 ?? ?? ?? ?? 8D 44 24 ?? 8B F1 6A ?? 50 89 74 24 ?? C7 44 24 ?? ?? 
            ?? ?? ?? E8 ?? ?? ?? ?? 33 C9 68 ?? ?? ?? ?? 51 8D 94 24 ?? ?? ?? ?? 52 66 89 8C 24 
            ?? ?? ?? ?? E8 ?? ?? ?? ?? 33 C0 68 ?? ?? ?? ?? 50 8D 8C 24 ?? ?? ?? ?? 51 66 89 84 
            24 ?? ?? ?? ?? E8 ?? ?? ?? ?? 56 8D 94 24 ?? ?? ?? ?? 68 ?? ?? ?? ?? 52 E8 ?? ?? ?? 
            ?? 83 C4 ?? 8D 44 24 ?? 50 8D 8C 24 ?? ?? ?? ?? 51 FF 15 ?? ?? ?? ?? 8B D8 83 FB ?? 
            0F 85 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 50 8D 94 24 ?? ?? ?? ?? 68 ?? ?? ?? ?? 52 E8 ?? 
            ?? ?? ?? 8B 35 ?? ?? ?? ?? 83 C4 ?? 8D 84 24 ?? ?? ?? ?? 50 FF D6 68 ?? ?? ?? ?? 8D 
            8C 24 ?? ?? ?? ?? 6A ?? 51 E8 ?? ?? ?? ?? 8D 94 24 ?? ?? ?? ?? 52 8D 84 24 ?? ?? ?? 
            ?? 68 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 8D 8C 24 ?? ?? ?? ?? 51 FF D6 B8 ?? ?? 
            ?? ?? 5F 5E 5B 8B 8C 24 ?? ?? ?? ?? 33 CC E8 ?? ?? ?? ?? 8B E5 5D C3 56 81 EC ?? ?? 
            ?? ?? B9 ?? ?? ?? ?? 8D B4 24 ?? ?? ?? ?? 8B FC F3 A5 E8 ?? ?? ?? ?? 81 C4 ?? ?? ?? 
            ?? 8D 54 24 ?? 52 53 FF 15 ?? ?? ?? ?? 85 C0 74 ?? 8B 44 24 ?? 50 81 EC ?? ?? ?? ?? 
            B9 ?? ?? ?? ?? 8D B4 24 ?? ?? ?? ?? 8B FC F3 A5 E8 ?? ?? ?? ?? 81 C4 ?? ?? ?? ?? 8D 
            4C 24 ?? 51 53 FF 15 ?? ?? ?? ?? 85 C0 75 ?? 53 FF 15 ?? ?? ?? ?? 8B 8C 24 ?? ?? ?? 
            ?? 5F 5E 5B 33 CC 33 C0 E8 ?? ?? ?? ?? 8B E5 5D C3 
        }

        $remote_connection_p1 = {
            55 8B EC B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? A1 ?? ?? ?? ?? 33 C5 89 45 ?? 53 56 33 C0 57 
            68 ?? ?? ?? ?? 50 8D 8D ?? ?? ?? ?? 51 66 89 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 89 85 
            ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 66 89 85 ?? ?? ?? ?? 88 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 
            68 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 6A ?? 52 C6 85 ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? 
            ?? ?? ?? 8D 85 ?? ?? ?? ?? 6A ?? 50 C6 85 ?? ?? ?? ?? ?? E8 ?? ?? ?? ?? 68 ?? ?? ?? 
            ?? 8D 8D ?? ?? ?? ?? 6A ?? 51 C7 85 ?? ?? ?? ?? ?? ?? ?? ?? C6 85 ?? ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 85 C0 75 ?? 
            68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 5F 5E 5B 8B 4D ?? 33 CD E8 ?? ?? ?? ?? 8B E5 5D C3 
            68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 68 ?? 
            ?? ?? ?? 52 E8 ?? ?? ?? ?? 8B 3D ?? ?? ?? ?? 8B 1D ?? ?? ?? ?? 83 C4 ?? 33 C0 68 ?? 
            ?? ?? ?? 50 89 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 
            8D 85 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 6A ?? 51 E8 ?? 
            ?? ?? ?? 83 C4 ?? 6A ?? 6A ?? 6A ?? FF 15 ?? ?? ?? ?? 8B F0 33 C0 89 85
        }

        $remote_connection_p2 = { 
            89 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 89 85 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? 
            ?? 66 89 95 ?? ?? ?? ?? 8B 48 ?? 8B 11 8B 02 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 51 8D 
            95 ?? ?? ?? ?? 68 ?? ?? ?? ?? 52 89 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 6A ?? FF 
            15 ?? ?? ?? ?? 66 89 85 ?? ?? ?? ?? 6A ?? 8D 85 ?? ?? ?? ?? 50 56 FF 15 ?? ?? ?? ?? 
            83 F8 ?? 0F 84 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 8D 50 ?? 8B FF 8A 08 40 84 C9 75 ?? 6A 
            ?? 2B C2 50 8D 8D ?? ?? ?? ?? 51 56 FF 15 ?? ?? ?? ?? 6A ?? 68 ?? ?? ?? ?? 8D 95 ?? 
            ?? ?? ?? 52 56 FF D3 8D 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 85 
            C0 0F 85 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF D7 8B 8D ?? ?? ?? ?? 51 FF 15 ?? ?? ?? ?? 50 
            8D 95 ?? ?? ?? ?? 68 ?? ?? ?? ?? 52 E8 ?? ?? ?? ?? 83 C4 ?? 8D 85 ?? ?? ?? ?? 50 FF 
            D7 68 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? 6A ?? 51 E8 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 52 8D 
            85 ?? ?? ?? ?? 68 ?? ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 8D 8D ?? ?? ?? ?? 51 FF D7 
            68 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 6A ?? 52 E8 ?? ?? ?? ?? 53 8D 85 ?? ?? ?? ?? 68 ?? 
            ?? ?? ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 8D 8D ?? ?? ?? ?? 51 FF D7 68 ?? ?? ?? ?? 8D 95 
            ?? ?? ?? ?? 6A ?? 52 E8 ?? ?? ?? ?? 83 C4 ?? 56 FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 
            15 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 40 89 85 ?? ?? ?? ?? 83 F8 ?? 0F 85 ?? ?? ?? ?? EB 
            ?? 68 ?? ?? ?? ?? FF D7 56 FF 15 ?? ?? ?? ?? 5F 5E 5B 8B 4D ?? 33 CD E8 ?? ?? ?? ?? 
            8B E5 5D C3 68 
        }

        $encrypt_files_p1 = {
            55 8B EC 83 E4 ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? A1 ?? ?? ?? ?? 33 C4 89 84 24 ?? ?? 
            ?? ?? 53 56 8B 75 ?? 57 68 ?? ?? ?? ?? 33 DB 8D 8C 24 ?? ?? ?? ?? 33 C0 53 51 66 89 
            84 24 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 8D 54 24 ?? 53 52 89 5C 24 
            ?? E8 ?? ?? ?? ?? 83 C4 ?? 6A ?? 8D 44 24 ?? 53 50 89 5C 24 ?? E8 ?? ?? ?? ?? 83 C4 
            ?? 33 C0 68 ?? ?? ?? ?? 8D 8C 24 ?? ?? ?? ?? 53 51 89 5C 24 ?? 89 44 24 ?? 89 44 24 
            ?? 89 44 24 ?? C7 44 24 ?? ?? ?? ?? ?? 88 84 24 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 ?? 
            68 ?? ?? ?? ?? 8D 94 24 ?? ?? ?? ?? 53 52 88 9C 24 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 C4 
            ?? 68 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 53 50 88 9C 24 ?? ?? ?? ?? E8 ?? ?? ?? ?? 83 
            C4 ?? 68 ?? ?? ?? ?? 8D 94 24 ?? ?? ?? ?? 33 C9 53 52 66 89 8C 24 ?? ?? ?? ?? E8 ?? 
            ?? ?? ?? 8B 4D ?? 8B C1 83 C4 ?? 48 74 ?? 48 74 ?? 8B 45 ?? 8B 55 ?? 50 52 51 56 FF 
            15 ?? ?? ?? ?? 5F 5E 5B 8B 8C 24 ?? ?? ?? ?? 33 CC E8 ?? ?? ?? ?? 8B E5 5D C2
        }

        $encrypt_files_p2 = {
            53 FF 15 ?? ?? ?? ?? 8B 8C 24 ?? ?? ?? ?? 5F 5E 5B 33 CC 33 C0 E8 ?? ?? ?? ?? 8B E5 
            5D C2 ?? ?? 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 50 68 ?? ?? ?? ?? 
            FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 53 E8 ?? ?? ?? ?? 83 C4 ?? 50 E8 
            ?? ?? ?? ?? 83 C4 ?? 33 F6 E8 ?? ?? ?? ?? 25 ?? ?? ?? ?? 79 ?? 48 0D ?? ?? ?? ?? 40 
            88 86 ?? ?? ?? ?? 46 83 FE ?? 7C ?? 33 F6 E8 ?? ?? ?? ?? 25 ?? ?? ?? ?? 79 ?? 48 0D 
            ?? ?? ?? ?? 40 88 86 ?? ?? ?? ?? 46 83 FE ?? 7C ?? 68 ?? ?? ?? ?? 8D 8C 24 ?? ?? ?? 
            ?? 68 ?? ?? ?? ?? 51 E8 ?? ?? ?? ?? 83 C4 ?? EB ?? 8D 49 ?? 0F B6 83 ?? ?? ?? ?? 6A 
            ?? 8D 94 24 ?? ?? ?? ?? 52 50 E8 ?? ?? ?? ?? 83 C4 ?? 8D 8C 24 ?? ?? ?? ?? 51 8D 94 
            24 ?? ?? ?? ?? 68 ?? ?? ?? ?? 52 E8 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 83 C4 ?? 8B C8 
            8A 10 40 84 D2 75 ?? 8D BC 24 ?? ?? ?? ?? 2B C1 8B F1 4F 8A 4F ?? 47 84 C9 75 ?? 8B 
            C8 C1 E9 ?? F3 A5 8B C8 83 E1 ?? 8D 84 24 ?? ?? ?? ?? F3 A4 8B C8 8A 10 40 84 D2 75 
            ?? BF ?? ?? ?? ?? 2B C1 8B F1 4F 8A 4F ?? 47 84 C9 75 ?? 8B C8 C1 E9 ?? F3 A5 8B C8
        }

        $encrypt_files_p3 = {
            68 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 83 E1 ?? 6A ?? 50 F3 A4 E8 ?? ?? ?? ?? 83 C4 ?? 
            68 ?? ?? ?? ?? 8D 8C 24 ?? ?? ?? ?? 6A ?? 51 E8 ?? ?? ?? ?? 43 83 C4 ?? 83 FB ?? 0F 
            8C ?? ?? ?? ?? 8D 94 24 ?? ?? ?? ?? 52 FF 15 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 84 24 ?? 
            ?? ?? ?? 6A ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 8D 8C 24 ?? ?? ?? ?? 68 ?? 
            ?? ?? ?? 51 E8 ?? ?? ?? ?? 83 C4 ?? 33 DB EB ?? 8D A4 24 ?? ?? ?? ?? EB ?? 8D 49 ?? 
            0F B6 83 ?? ?? ?? ?? 6A ?? 8D 94 24 ?? ?? ?? ?? 52 50 E8 ?? ?? ?? ?? 83 C4 ?? 8D 8C 
            24 ?? ?? ?? ?? 51 8D 94 24 ?? ?? ?? ?? 68 ?? ?? ?? ?? 52 E8 ?? ?? ?? ?? 8D 84 24 ?? 
            ?? ?? ?? 83 C4 ?? 8B C8 8A 10 40 84 D2 75 ?? 8D BC 24 ?? ?? ?? ?? 2B C1 8B F1 4F 8A 
            4F ?? 47 84 C9 75 ?? 8B C8 C1 E9 ?? F3 A5 8B C8 83 E1 ?? 8D 84 24 ?? ?? ?? ?? F3 A4 
            8B C8 8A 10 40 84 D2 75 ?? BF ?? ?? ?? ?? 2B C1 8B F1 4F 8A 4F ?? 47 84 C9 75 ?? 8B
        }

        $encrypt_files_p4 = { 
            C8 C1 E9 ?? F3 A5 8B C8 68 ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 83 E1 ?? 6A ?? 50 F3 A4 
            E8 ?? ?? ?? ?? 83 C4 ?? 68 ?? ?? ?? ?? 8D 8C 24 ?? ?? ?? ?? 6A ?? 51 E8 ?? ?? ?? ?? 
            43 83 C4 ?? 83 FB ?? 0F 8C ?? ?? ?? ?? 8D 94 24 ?? ?? ?? ?? 52 FF 15 ?? ?? ?? ?? 68 
            ?? ?? ?? ?? 8D 84 24 ?? ?? ?? ?? 6A ?? 50 E8 ?? ?? ?? ?? 83 C4 ?? E8 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 8B 1D ?? ?? ?? ?? BF ?? ?? ?? ?? 8D B4 24 ?? ?? ?? ?? 57 68 ?? ?? ?? ?? 
            56 FF D3 83 C4 ?? 56 FF 15 ?? ?? ?? ?? 83 F8 ?? 75 ?? 6A ?? 6A ?? 56 68 ?? ?? ?? ?? 
            6A ?? 6A ?? E8 ?? ?? ?? ?? 8B 4C 24 ?? 83 C4 ?? 89 44 8C ?? 41 89 4C 24 ?? 47 83 C6 
            ?? 83 FF ?? 7E ?? 8B 54 24 ?? 6A ?? 6A ?? 8D 4C 24 ?? 51 52 FF 15 ?? ?? ?? ?? 8D 44 
            24 ?? 50 8D 4C 24 ?? 51 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 6A ?? 68 ?? ?? ?? ?? FF 
            15 ?? ?? ?? ?? 85 C0 75 ?? 68 ?? ?? ?? ?? EB ?? 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? E8 
            ?? ?? ?? ?? 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 6A ?? FF 15 
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            $find_files
        ) and
        (
            all of ($encrypt_files_p*)
        ) and
        (
            all of ($remote_connection_p*)
        )
}