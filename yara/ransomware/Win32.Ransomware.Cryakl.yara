rule Win32_Ransomware_Cryakl : tc_detection malicious
{
    meta:

        author              = "ReversingLabs"

        source              = "ReversingLabs"
        status              = "RELEASED"
        sharing             = "TLP:WHITE"
        category            = "MALWARE"
        description         = "Yara rule that detects Cryakl ransomware."

        tc_detection_type   = "Ransomware"
        tc_detection_name   = "Cryakl"
        tc_detection_factor = 5

    strings:

        $enum_and_encrypt_files_1 = {
            8B 85 ?? ?? ?? ?? 50 8D 95 ?? ?? ?? ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? 
            ?? 5A E8 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? ?? 
            ?? 8B 85 ?? ?? ?? ?? 50 8D 95 ?? ?? ?? ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? 
            ?? ?? 5A E8 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? ?? 
            ?? ?? 8B 85 ?? ?? ?? ?? 50 8D 95 ?? ?? ?? ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? 
            ?? ?? ?? 5A E8 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? 8B 45 ?? E8 ?? 
            ?? ?? ?? 8B 85 ?? ?? ?? ?? 50 8D 95 ?? ?? ?? ?? B8 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 
            ?? ?? ?? ?? 5A E8 ?? ?? ?? ?? 85 C0 0F 85 ?? ?? ?? ?? 33 C0 55 68 ?? ?? ?? ?? 64 FF 
            30 64 89 20 8B 45 ?? E8 ?? ?? ?? ?? 8B 55 ?? 80 7C 02 ?? ?? 74 ?? 8D 45 ?? BA ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? 6A ?? E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? B9 ?? ?? ?? ?? 8B 55 ?? 
            E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 8D 8D ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 85 
            C0 0F 85 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? 
            ?? 8B 85 ?? ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 8B 85 ?? ?? ?? 
            ?? 83 E0 ?? 83 F8 ?? 75 ?? A1 ?? ?? ?? ?? 8B 80 ?? ?? ?? ?? 8B 10 FF 92 ?? ?? ?? ?? 
            84 C0 0F 84 ?? ?? ?? ?? FF 75 ?? FF B5 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85
        }

        $enum_and_encrypt_files_2 = { 
            BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? E9 ?? ?? ?? ?? 8D 85 
            ?? ?? ?? ?? 8B 8D ?? ?? ?? ?? 8B 55 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 50 8D 95 ?? 
            ?? ?? ?? 33 C0 E8 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 58 E8 ?? ?? ?? ?? 0F 84 ?? ?? ?? ?? 
            C6 45 ?? ?? A1 ?? ?? ?? ?? 8B 80 ?? ?? ?? ?? 8B 80 ?? ?? ?? ?? 8B 10 FF 52 ?? 8B D8 
            4B 85 DB 0F 8C ?? ?? ?? ?? 43 33 F6 8D 95 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? E8 ?? ?? ?? 
            ?? 8B 85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 50 8D 8D ?? 
            ?? ?? ?? A1 ?? ?? ?? ?? 8B 80 ?? ?? ?? ?? 8B 80 ?? ?? ?? ?? 8B D6 8B 38 FF 57 ?? 8B 
            85 ?? ?? ?? ?? 8D 95 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 8D ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? 
            BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? 58 E8 ?? ?? ?? ?? 75 ?? C6 45 ?? ?? 
            46 4B 0F 85 ?? ?? ?? ?? 80 7D ?? ?? 0F 84 ?? ?? ?? ?? A1 ?? ?? ?? ?? 50 A1 ?? ?? ?? 
            ?? 50 8D 85 ?? ?? ?? ?? 8B 8D ?? ?? ?? ?? 8B 55 ?? E8 ?? ?? ?? ?? 8B 85 ?? ?? ?? ?? 
            8B 0D ?? ?? ?? ?? 8B 15 ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 05 ?? ?? ?? ?? 8B 15 ?? ?? ?? 
            ?? 83 C0 ?? 83 D2 ?? 89 05 ?? ?? ?? ?? 89 15 ?? ?? ?? ?? A1 ?? ?? ?? ?? 8B 80 ?? ?? 
            ?? ?? 8B 10 FF 92 ?? ?? ?? ?? 84 C0 75 ?? 68 ?? ?? ?? ?? FF 35 ?? ?? ?? ?? FF 35 ?? 
            ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? ?? ?? FF B5 ?? ?? ?? ?? 68 ?? ?? ?? ?? 8D 85 ?? 
            ?? ?? ?? BA ?? ?? ?? ?? E8 ?? ?? ?? ?? 8B 95 ?? ?? ?? ?? A1 ?? ?? ?? ?? 8B 80 ?? ?? 
            ?? ?? E8 ?? ?? ?? ?? A1 ?? ?? ?? ?? 8B 00 E8 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8 ?? ?? 
            ?? ?? 85 C0 0F 84 ?? ?? ?? ?? 8D 85 ?? ?? ?? ?? E8
        }

    condition:
        uint16(0) == 0x5A4D and
        (
            (all of ($enum_and_encrypt_files_*))
        )
}