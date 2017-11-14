/*
 * BitCracker: BitLocker password cracking tool, OpenCL version.
 * Copyright (C) 2013-2017  Elena Ago <elena dot ago at gmail dot com>
 *                          Massimo Bernaschi <massimo dot bernaschi at gmail dot com>
 * 
 * This file is part of the BitCracker project: https://github.com/e-ago/bitcracker
 * 
 * BitCracker is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 * 
 * BitCracker is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with BitCracker. If not, see <http://www.gnu.org/licenses/>.
 */

__constant unsigned int TS0[256] = {
        0xC66363A5U, 0xF87C7C84U, 0xEE777799U, 0xF67B7B8DU, 0xFFF2F20DU, 0xD66B6BBDU, 0xDE6F6FB1U, 0x91C5C554U, 
        0x60303050U, 0x02010103U, 0xCE6767A9U, 0x562B2B7DU, 0xE7FEFE19U, 0xB5D7D762U, 0x4DABABE6U, 0xEC76769AU, 
        0x8FCACA45U, 0x1F82829DU, 0x89C9C940U, 0xFA7D7D87U, 0xEFFAFA15U, 0xB25959EBU, 0x8E4747C9U, 0xFBF0F00BU, 
        0x41ADADECU, 0xB3D4D467U, 0x5FA2A2FDU, 0x45AFAFEAU, 0x239C9CBFU, 0x53A4A4F7U, 0xE4727296U, 0x9BC0C05BU, 
        0x75B7B7C2U, 0xE1FDFD1CU, 0x3D9393AEU, 0x4C26266AU, 0x6C36365AU, 0x7E3F3F41U, 0xF5F7F702U, 0x83CCCC4FU, 
        0x6834345CU, 0x51A5A5F4U, 0xD1E5E534U, 0xF9F1F108U, 0xE2717193U, 0xABD8D873U, 0x62313153U, 0x2A15153FU, 
        0x0804040CU, 0x95C7C752U, 0x46232365U, 0x9DC3C35EU, 0x30181828U, 0x379696A1U, 0x0A05050FU, 0x2F9A9AB5U, 
        0x0E070709U, 0x24121236U, 0x1B80809BU, 0xDFE2E23DU, 0xCDEBEB26U, 0x4E272769U, 0x7FB2B2CDU, 0xEA75759FU, 
        0x1209091BU, 0x1D83839EU, 0x582C2C74U, 0x341A1A2EU, 0x361B1B2DU, 0xDC6E6EB2U, 0xB45A5AEEU, 0x5BA0A0FBU, 
        0xA45252F6U, 0x763B3B4DU, 0xB7D6D661U, 0x7DB3B3CEU, 0x5229297BU, 0xDDE3E33EU, 0x5E2F2F71U, 0x13848497U, 
        0xA65353F5U, 0xB9D1D168U, 0x00000000U, 0xC1EDED2CU, 0x40202060U, 0xE3FCFC1FU, 0x79B1B1C8U, 0xB65B5BEDU, 
        0xD46A6ABEU, 0x8DCBCB46U, 0x67BEBED9U, 0x7239394BU, 0x944A4ADEU, 0x984C4CD4U, 0xB05858E8U, 0x85CFCF4AU, 
        0xBBD0D06BU, 0xC5EFEF2AU, 0x4FAAAAE5U, 0xEDFBFB16U, 0x864343C5U, 0x9A4D4DD7U, 0x66333355U, 0x11858594U, 
        0x8A4545CFU, 0xE9F9F910U, 0x04020206U, 0xFE7F7F81U, 0xA05050F0U, 0x783C3C44U, 0x259F9FBAU, 0x4BA8A8E3U, 
        0xA25151F3U, 0x5DA3A3FEU, 0x804040C0U, 0x058F8F8AU, 0x3F9292ADU, 0x219D9DBCU, 0x70383848U, 0xF1F5F504U, 
        0x63BCBCDFU, 0x77B6B6C1U, 0xAFDADA75U, 0x42212163U, 0x20101030U, 0xE5FFFF1AU, 0xFDF3F30EU, 0xBFD2D26DU, 
        0x81CDCD4CU, 0x180C0C14U, 0x26131335U, 0xC3ECEC2FU, 0xBE5F5FE1U, 0x359797A2U, 0x884444CCU, 0x2E171739U, 
        0x93C4C457U, 0x55A7A7F2U, 0xFC7E7E82U, 0x7A3D3D47U, 0xC86464ACU, 0xBA5D5DE7U, 0x3219192BU, 0xE6737395U, 
        0xC06060A0U, 0x19818198U, 0x9E4F4FD1U, 0xA3DCDC7FU, 0x44222266U, 0x542A2A7EU, 0x3B9090ABU, 0x0B888883U, 
        0x8C4646CAU, 0xC7EEEE29U, 0x6BB8B8D3U, 0x2814143CU, 0xA7DEDE79U, 0xBC5E5EE2U, 0x160B0B1DU, 0xADDBDB76U, 
        0xDBE0E03BU, 0x64323256U, 0x743A3A4EU, 0x140A0A1EU, 0x924949DBU, 0x0C06060AU, 0x4824246CU, 0xB85C5CE4U, 
        0x9FC2C25DU, 0xBDD3D36EU, 0x43ACACEFU, 0xC46262A6U, 0x399191A8U, 0x319595A4U, 0xD3E4E437U, 0xF279798BU, 
        0xD5E7E732U, 0x8BC8C843U, 0x6E373759U, 0xDA6D6DB7U, 0x018D8D8CU, 0xB1D5D564U, 0x9C4E4ED2U, 0x49A9A9E0U, 
        0xD86C6CB4U, 0xAC5656FAU, 0xF3F4F407U, 0xCFEAEA25U, 0xCA6565AFU, 0xF47A7A8EU, 0x47AEAEE9U, 0x10080818U, 
        0x6FBABAD5U, 0xF0787888U, 0x4A25256FU, 0x5C2E2E72U, 0x381C1C24U, 0x57A6A6F1U, 0x73B4B4C7U, 0x97C6C651U, 
        0xCBE8E823U, 0xA1DDDD7CU, 0xE874749CU, 0x3E1F1F21U, 0x964B4BDDU, 0x61BDBDDCU, 0x0D8B8B86U, 0x0F8A8A85U, 
        0xE0707090U, 0x7C3E3E42U, 0x71B5B5C4U, 0xCC6666AAU, 0x904848D8U, 0x06030305U, 0xF7F6F601U, 0x1C0E0E12U, 
        0xC26161A3U, 0x6A35355FU, 0xAE5757F9U, 0x69B9B9D0U, 0x17868691U, 0x99C1C158U, 0x3A1D1D27U, 0x279E9EB9U, 
        0xD9E1E138U, 0xEBF8F813U, 0x2B9898B3U, 0x22111133U, 0xD26969BBU, 0xA9D9D970U, 0x078E8E89U, 0x339494A7U, 
        0x2D9B9BB6U, 0x3C1E1E22U, 0x15878792U, 0xC9E9E920U, 0x87CECE49U, 0xAA5555FFU, 0x50282878U, 0xA5DFDF7AU, 
        0x038C8C8FU, 0x59A1A1F8U, 0x09898980U, 0x1A0D0D17U, 0x65BFBFDAU, 0xD7E6E631U, 0x844242C6U, 0xD06868B8U, 
        0x824141C3U, 0x299999B0U, 0x5A2D2D77U, 0x1E0F0F11U, 0x7BB0B0CBU, 0xA85454FCU, 0x6DBBBBD6U, 0x2C16163AU
};

__constant unsigned int TS1[256] = {
        0xA5C66363U, 0x84F87C7CU, 0x99EE7777U, 0x8DF67B7BU, 0x0DFFF2F2U, 0xBDD66B6BU, 0xB1DE6F6FU, 0x5491C5C5U, 
        0x50603030U, 0x03020101U, 0xA9CE6767U, 0x7D562B2BU, 0x19E7FEFEU, 0x62B5D7D7U, 0xE64DABABU, 0x9AEC7676U, 
        0x458FCACAU, 0x9D1F8282U, 0x4089C9C9U, 0x87FA7D7DU, 0x15EFFAFAU, 0xEBB25959U, 0xC98E4747U, 0x0BFBF0F0U, 
        0xEC41ADADU, 0x67B3D4D4U, 0xFD5FA2A2U, 0xEA45AFAFU, 0xBF239C9CU, 0xF753A4A4U, 0x96E47272U, 0x5B9BC0C0U, 
        0xC275B7B7U, 0x1CE1FDFDU, 0xAE3D9393U, 0x6A4C2626U, 0x5A6C3636U, 0x417E3F3FU, 0x02F5F7F7U, 0x4F83CCCCU, 
        0x5C683434U, 0xF451A5A5U, 0x34D1E5E5U, 0x08F9F1F1U, 0x93E27171U, 0x73ABD8D8U, 0x53623131U, 0x3F2A1515U, 
        0x0C080404U, 0x5295C7C7U, 0x65462323U, 0x5E9DC3C3U, 0x28301818U, 0xA1379696U, 0x0F0A0505U, 0xB52F9A9AU, 
        0x090E0707U, 0x36241212U, 0x9B1B8080U, 0x3DDFE2E2U, 0x26CDEBEBU, 0x694E2727U, 0xCD7FB2B2U, 0x9FEA7575U, 
        0x1B120909U, 0x9E1D8383U, 0x74582C2CU, 0x2E341A1AU, 0x2D361B1BU, 0xB2DC6E6EU, 0xEEB45A5AU, 0xFB5BA0A0U, 
        0xF6A45252U, 0x4D763B3BU, 0x61B7D6D6U, 0xCE7DB3B3U, 0x7B522929U, 0x3EDDE3E3U, 0x715E2F2FU, 0x97138484U, 
        0xF5A65353U, 0x68B9D1D1U, 0x00000000U, 0x2CC1EDEDU, 0x60402020U, 0x1FE3FCFCU, 0xC879B1B1U, 0xEDB65B5BU, 
        0xBED46A6AU, 0x468DCBCBU, 0xD967BEBEU, 0x4B723939U, 0xDE944A4AU, 0xD4984C4CU, 0xE8B05858U, 0x4A85CFCFU, 
        0x6BBBD0D0U, 0x2AC5EFEFU, 0xE54FAAAAU, 0x16EDFBFBU, 0xC5864343U, 0xD79A4D4DU, 0x55663333U, 0x94118585U, 
        0xCF8A4545U, 0x10E9F9F9U, 0x06040202U, 0x81FE7F7FU, 0xF0A05050U, 0x44783C3CU, 0xBA259F9FU, 0xE34BA8A8U, 
        0xF3A25151U, 0xFE5DA3A3U, 0xC0804040U, 0x8A058F8FU, 0xAD3F9292U, 0xBC219D9DU, 0x48703838U, 0x04F1F5F5U, 
        0xDF63BCBCU, 0xC177B6B6U, 0x75AFDADAU, 0x63422121U, 0x30201010U, 0x1AE5FFFFU, 0x0EFDF3F3U, 0x6DBFD2D2U, 
        0x4C81CDCDU, 0x14180C0CU, 0x35261313U, 0x2FC3ECECU, 0xE1BE5F5FU, 0xA2359797U, 0xCC884444U, 0x392E1717U, 
        0x5793C4C4U, 0xF255A7A7U, 0x82FC7E7EU, 0x477A3D3DU, 0xACC86464U, 0xE7BA5D5DU, 0x2B321919U, 0x95E67373U, 
        0xA0C06060U, 0x98198181U, 0xD19E4F4FU, 0x7FA3DCDCU, 0x66442222U, 0x7E542A2AU, 0xAB3B9090U, 0x830B8888U, 
        0xCA8C4646U, 0x29C7EEEEU, 0xD36BB8B8U, 0x3C281414U, 0x79A7DEDEU, 0xE2BC5E5EU, 0x1D160B0BU, 0x76ADDBDBU, 
        0x3BDBE0E0U, 0x56643232U, 0x4E743A3AU, 0x1E140A0AU, 0xDB924949U, 0x0A0C0606U, 0x6C482424U, 0xE4B85C5CU, 
        0x5D9FC2C2U, 0x6EBDD3D3U, 0xEF43ACACU, 0xA6C46262U, 0xA8399191U, 0xA4319595U, 0x37D3E4E4U, 0x8BF27979U, 
        0x32D5E7E7U, 0x438BC8C8U, 0x596E3737U, 0xB7DA6D6DU, 0x8C018D8DU, 0x64B1D5D5U, 0xD29C4E4EU, 0xE049A9A9U, 
        0xB4D86C6CU, 0xFAAC5656U, 0x07F3F4F4U, 0x25CFEAEAU, 0xAFCA6565U, 0x8EF47A7AU, 0xE947AEAEU, 0x18100808U, 
        0xD56FBABAU, 0x88F07878U, 0x6F4A2525U, 0x725C2E2EU, 0x24381C1CU, 0xF157A6A6U, 0xC773B4B4U, 0x5197C6C6U, 
        0x23CBE8E8U, 0x7CA1DDDDU, 0x9CE87474U, 0x213E1F1FU, 0xDD964B4BU, 0xDC61BDBDU, 0x860D8B8BU, 0x850F8A8AU, 
        0x90E07070U, 0x427C3E3EU, 0xC471B5B5U, 0xAACC6666U, 0xD8904848U, 0x05060303U, 0x01F7F6F6U, 0x121C0E0EU, 
        0xA3C26161U, 0x5F6A3535U, 0xF9AE5757U, 0xD069B9B9U, 0x91178686U, 0x5899C1C1U, 0x273A1D1DU, 0xB9279E9EU, 
        0x38D9E1E1U, 0x13EBF8F8U, 0xB32B9898U, 0x33221111U, 0xBBD26969U, 0x70A9D9D9U, 0x89078E8EU, 0xA7339494U, 
        0xB62D9B9BU, 0x223C1E1EU, 0x92158787U, 0x20C9E9E9U, 0x4987CECEU, 0xFFAA5555U, 0x78502828U, 0x7AA5DFDFU, 
        0x8F038C8CU, 0xF859A1A1U, 0x80098989U, 0x171A0D0DU, 0xDA65BFBFU, 0x31D7E6E6U, 0xC6844242U, 0xB8D06868U, 
        0xC3824141U, 0xB0299999U, 0x775A2D2DU, 0x111E0F0FU, 0xCB7BB0B0U, 0xFCA85454U, 0xD66DBBBBU, 0x3A2C1616U
};

__constant unsigned int TS2[256] = {
        0x63A5C663U, 0x7C84F87CU, 0x7799EE77U, 0x7B8DF67BU, 0xF20DFFF2U, 0x6BBDD66BU, 0x6FB1DE6FU, 0xC55491C5U, 
        0x30506030U, 0x01030201U, 0x67A9CE67U, 0x2B7D562BU, 0xFE19E7FEU, 0xD762B5D7U, 0xABE64DABU, 0x769AEC76U, 
        0xCA458FCAU, 0x829D1F82U, 0xC94089C9U, 0x7D87FA7DU, 0xFA15EFFAU, 0x59EBB259U, 0x47C98E47U, 0xF00BFBF0U, 
        0xADEC41ADU, 0xD467B3D4U, 0xA2FD5FA2U, 0xAFEA45AFU, 0x9CBF239CU, 0xA4F753A4U, 0x7296E472U, 0xC05B9BC0U, 
        0xB7C275B7U, 0xFD1CE1FDU, 0x93AE3D93U, 0x266A4C26U, 0x365A6C36U, 0x3F417E3FU, 0xF702F5F7U, 0xCC4F83CCU, 
        0x345C6834U, 0xA5F451A5U, 0xE534D1E5U, 0xF108F9F1U, 0x7193E271U, 0xD873ABD8U, 0x31536231U, 0x153F2A15U, 
        0x040C0804U, 0xC75295C7U, 0x23654623U, 0xC35E9DC3U, 0x18283018U, 0x96A13796U, 0x050F0A05U, 0x9AB52F9AU, 
        0x07090E07U, 0x12362412U, 0x809B1B80U, 0xE23DDFE2U, 0xEB26CDEBU, 0x27694E27U, 0xB2CD7FB2U, 0x759FEA75U, 
        0x091B1209U, 0x839E1D83U, 0x2C74582CU, 0x1A2E341AU, 0x1B2D361BU, 0x6EB2DC6EU, 0x5AEEB45AU, 0xA0FB5BA0U, 
        0x52F6A452U, 0x3B4D763BU, 0xD661B7D6U, 0xB3CE7DB3U, 0x297B5229U, 0xE33EDDE3U, 0x2F715E2FU, 0x84971384U, 
        0x53F5A653U, 0xD168B9D1U, 0x00000000U, 0xED2CC1EDU, 0x20604020U, 0xFC1FE3FCU, 0xB1C879B1U, 0x5BEDB65BU, 
        0x6ABED46AU, 0xCB468DCBU, 0xBED967BEU, 0x394B7239U, 0x4ADE944AU, 0x4CD4984CU, 0x58E8B058U, 0xCF4A85CFU, 
        0xD06BBBD0U, 0xEF2AC5EFU, 0xAAE54FAAU, 0xFB16EDFBU, 0x43C58643U, 0x4DD79A4DU, 0x33556633U, 0x85941185U, 
        0x45CF8A45U, 0xF910E9F9U, 0x02060402U, 0x7F81FE7FU, 0x50F0A050U, 0x3C44783CU, 0x9FBA259FU, 0xA8E34BA8U, 
        0x51F3A251U, 0xA3FE5DA3U, 0x40C08040U, 0x8F8A058FU, 0x92AD3F92U, 0x9DBC219DU, 0x38487038U, 0xF504F1F5U, 
        0xBCDF63BCU, 0xB6C177B6U, 0xDA75AFDAU, 0x21634221U, 0x10302010U, 0xFF1AE5FFU, 0xF30EFDF3U, 0xD26DBFD2U, 
        0xCD4C81CDU, 0x0C14180CU, 0x13352613U, 0xEC2FC3ECU, 0x5FE1BE5FU, 0x97A23597U, 0x44CC8844U, 0x17392E17U, 
        0xC45793C4U, 0xA7F255A7U, 0x7E82FC7EU, 0x3D477A3DU, 0x64ACC864U, 0x5DE7BA5DU, 0x192B3219U, 0x7395E673U, 
        0x60A0C060U, 0x81981981U, 0x4FD19E4FU, 0xDC7FA3DCU, 0x22664422U, 0x2A7E542AU, 0x90AB3B90U, 0x88830B88U, 
        0x46CA8C46U, 0xEE29C7EEU, 0xB8D36BB8U, 0x143C2814U, 0xDE79A7DEU, 0x5EE2BC5EU, 0x0B1D160BU, 0xDB76ADDBU, 
        0xE03BDBE0U, 0x32566432U, 0x3A4E743AU, 0x0A1E140AU, 0x49DB9249U, 0x060A0C06U, 0x246C4824U, 0x5CE4B85CU, 
        0xC25D9FC2U, 0xD36EBDD3U, 0xACEF43ACU, 0x62A6C462U, 0x91A83991U, 0x95A43195U, 0xE437D3E4U, 0x798BF279U, 
        0xE732D5E7U, 0xC8438BC8U, 0x37596E37U, 0x6DB7DA6DU, 0x8D8C018DU, 0xD564B1D5U, 0x4ED29C4EU, 0xA9E049A9U, 
        0x6CB4D86CU, 0x56FAAC56U, 0xF407F3F4U, 0xEA25CFEAU, 0x65AFCA65U, 0x7A8EF47AU, 0xAEE947AEU, 0x08181008U, 
        0xBAD56FBAU, 0x7888F078U, 0x256F4A25U, 0x2E725C2EU, 0x1C24381CU, 0xA6F157A6U, 0xB4C773B4U, 0xC65197C6U, 
        0xE823CBE8U, 0xDD7CA1DDU, 0x749CE874U, 0x1F213E1FU, 0x4BDD964BU, 0xBDDC61BDU, 0x8B860D8BU, 0x8A850F8AU, 
        0x7090E070U, 0x3E427C3EU, 0xB5C471B5U, 0x66AACC66U, 0x48D89048U, 0x03050603U, 0xF601F7F6U, 0x0E121C0EU, 
        0x61A3C261U, 0x355F6A35U, 0x57F9AE57U, 0xB9D069B9U, 0x86911786U, 0xC15899C1U, 0x1D273A1DU, 0x9EB9279EU, 
        0xE138D9E1U, 0xF813EBF8U, 0x98B32B98U, 0x11332211U, 0x69BBD269U, 0xD970A9D9U, 0x8E89078EU, 0x94A73394U, 
        0x9BB62D9BU, 0x1E223C1EU, 0x87921587U, 0xE920C9E9U, 0xCE4987CEU, 0x55FFAA55U, 0x28785028U, 0xDF7AA5DFU, 
        0x8C8F038CU, 0xA1F859A1U, 0x89800989U, 0x0D171A0DU, 0xBFDA65BFU, 0xE631D7E6U, 0x42C68442U, 0x68B8D068U, 
        0x41C38241U, 0x99B02999U, 0x2D775A2DU, 0x0F111E0FU, 0xB0CB7BB0U, 0x54FCA854U, 0xBBD66DBBU, 0x163A2C16U
};
__constant unsigned int TS3[256] = {
        0x6363A5C6U, 0x7C7C84F8U, 0x777799EEU, 0x7B7B8DF6U, 0xF2F20DFFU, 0x6B6BBDD6U, 0x6F6FB1DEU, 0xC5C55491U, 
        0x30305060U, 0x01010302U, 0x6767A9CEU, 0x2B2B7D56U, 0xFEFE19E7U, 0xD7D762B5U, 0xABABE64DU, 0x76769AECU, 
        0xCACA458FU, 0x82829D1FU, 0xC9C94089U, 0x7D7D87FAU, 0xFAFA15EFU, 0x5959EBB2U, 0x4747C98EU, 0xF0F00BFBU, 
        0xADADEC41U, 0xD4D467B3U, 0xA2A2FD5FU, 0xAFAFEA45U, 0x9C9CBF23U, 0xA4A4F753U, 0x727296E4U, 0xC0C05B9BU, 
        0xB7B7C275U, 0xFDFD1CE1U, 0x9393AE3DU, 0x26266A4CU, 0x36365A6CU, 0x3F3F417EU, 0xF7F702F5U, 0xCCCC4F83U, 
        0x34345C68U, 0xA5A5F451U, 0xE5E534D1U, 0xF1F108F9U, 0x717193E2U, 0xD8D873ABU, 0x31315362U, 0x15153F2AU, 
        0x04040C08U, 0xC7C75295U, 0x23236546U, 0xC3C35E9DU, 0x18182830U, 0x9696A137U, 0x05050F0AU, 0x9A9AB52FU, 
        0x0707090EU, 0x12123624U, 0x80809B1BU, 0xE2E23DDFU, 0xEBEB26CDU, 0x2727694EU, 0xB2B2CD7FU, 0x75759FEAU, 
        0x09091B12U, 0x83839E1DU, 0x2C2C7458U, 0x1A1A2E34U, 0x1B1B2D36U, 0x6E6EB2DCU, 0x5A5AEEB4U, 0xA0A0FB5BU, 
        0x5252F6A4U, 0x3B3B4D76U, 0xD6D661B7U, 0xB3B3CE7DU, 0x29297B52U, 0xE3E33EDDU, 0x2F2F715EU, 0x84849713U, 
        0x5353F5A6U, 0xD1D168B9U, 0x00000000U, 0xEDED2CC1U, 0x20206040U, 0xFCFC1FE3U, 0xB1B1C879U, 0x5B5BEDB6U, 
        0x6A6ABED4U, 0xCBCB468DU, 0xBEBED967U, 0x39394B72U, 0x4A4ADE94U, 0x4C4CD498U, 0x5858E8B0U, 0xCFCF4A85U, 
        0xD0D06BBBU, 0xEFEF2AC5U, 0xAAAAE54FU, 0xFBFB16EDU, 0x4343C586U, 0x4D4DD79AU, 0x33335566U, 0x85859411U, 
        0x4545CF8AU, 0xF9F910E9U, 0x02020604U, 0x7F7F81FEU, 0x5050F0A0U, 0x3C3C4478U, 0x9F9FBA25U, 0xA8A8E34BU, 
        0x5151F3A2U, 0xA3A3FE5DU, 0x4040C080U, 0x8F8F8A05U, 0x9292AD3FU, 0x9D9DBC21U, 0x38384870U, 0xF5F504F1U, 
        0xBCBCDF63U, 0xB6B6C177U, 0xDADA75AFU, 0x21216342U, 0x10103020U, 0xFFFF1AE5U, 0xF3F30EFDU, 0xD2D26DBFU, 
        0xCDCD4C81U, 0x0C0C1418U, 0x13133526U, 0xECEC2FC3U, 0x5F5FE1BEU, 0x9797A235U, 0x4444CC88U, 0x1717392EU, 
        0xC4C45793U, 0xA7A7F255U, 0x7E7E82FCU, 0x3D3D477AU, 0x6464ACC8U, 0x5D5DE7BAU, 0x19192B32U, 0x737395E6U, 
        0x6060A0C0U, 0x81819819U, 0x4F4FD19EU, 0xDCDC7FA3U, 0x22226644U, 0x2A2A7E54U, 0x9090AB3BU, 0x8888830BU, 
        0x4646CA8CU, 0xEEEE29C7U, 0xB8B8D36BU, 0x14143C28U, 0xDEDE79A7U, 0x5E5EE2BCU, 0x0B0B1D16U, 0xDBDB76ADU, 
        0xE0E03BDBU, 0x32325664U, 0x3A3A4E74U, 0x0A0A1E14U, 0x4949DB92U, 0x06060A0CU, 0x24246C48U, 0x5C5CE4B8U, 
        0xC2C25D9FU, 0xD3D36EBDU, 0xACACEF43U, 0x6262A6C4U, 0x9191A839U, 0x9595A431U, 0xE4E437D3U, 0x79798BF2U, 
        0xE7E732D5U, 0xC8C8438BU, 0x3737596EU, 0x6D6DB7DAU, 0x8D8D8C01U, 0xD5D564B1U, 0x4E4ED29CU, 0xA9A9E049U, 
        0x6C6CB4D8U, 0x5656FAACU, 0xF4F407F3U, 0xEAEA25CFU, 0x6565AFCAU, 0x7A7A8EF4U, 0xAEAEE947U, 0x08081810U, 
        0xBABAD56FU, 0x787888F0U, 0x25256F4AU, 0x2E2E725CU, 0x1C1C2438U, 0xA6A6F157U, 0xB4B4C773U, 0xC6C65197U, 
        0xE8E823CBU, 0xDDDD7CA1U, 0x74749CE8U, 0x1F1F213EU, 0x4B4BDD96U, 0xBDBDDC61U, 0x8B8B860DU, 0x8A8A850FU, 
        0x707090E0U, 0x3E3E427CU, 0xB5B5C471U, 0x6666AACCU, 0x4848D890U, 0x03030506U, 0xF6F601F7U, 0x0E0E121CU, 
        0x6161A3C2U, 0x35355F6AU, 0x5757F9AEU, 0xB9B9D069U, 0x86869117U, 0xC1C15899U, 0x1D1D273AU, 0x9E9EB927U, 
        0xE1E138D9U, 0xF8F813EBU, 0x9898B32BU, 0x11113322U, 0x6969BBD2U, 0xD9D970A9U, 0x8E8E8907U, 0x9494A733U, 
        0x9B9BB62DU, 0x1E1E223CU, 0x87879215U, 0xE9E920C9U, 0xCECE4987U, 0x5555FFAAU, 0x28287850U, 0xDFDF7AA5U, 
        0x8C8C8F03U, 0xA1A1F859U, 0x89898009U, 0x0D0D171AU, 0xBFBFDA65U, 0xE6E631D7U, 0x4242C684U, 0x6868B8D0U, 
        0x4141C382U, 0x9999B029U, 0x2D2D775AU, 0x0F0F111EU, 0xB0B0CB7BU, 0x5454FCA8U, 0xBBBBD66DU, 0x16163A2CU
};

#define MIN(a,b) (((a)<(b))?(a):(b))
#define AES_CTX_LENGTH 256
#define FALSE 0
#define TRUE 1
#define SALT_SIZE 16
#define MAC_SIZE 16
#define NONCE_SIZE 12
#define IV_SIZE 16
#define VMK_DECRYPT_SIZE 16
#define DICT_BUFSIZE    (50*1024*1024)

#define HASH_SIZE 8 //32
#define ROUND_SHA_NUM 64
#define SINGLE_BLOCK_SHA_SIZE 64
#define SINGLE_BLOCK_W_SIZE 64
#define PADDING_SIZE 40
#define ITERATION_NUMBER 0x100000
#define WORD_SIZE 4
#define INPUT_SIZE 2048
#define FIXED_PART_INPUT_CHAIN_HASH 88
#define MAX_INPUT_PASSWORD_LEN 27
#define FIXED_PASSWORD_BUFFER 32

#define BLOCK_UNIT 32
#define HASH_SIZE_STRING 32
#define END_STRING 0x80

#define BLOCK_SIZE 64

#define ROR7(x) (((x) << 25) | ((x) >> 7))
#define ROR18(x) (((x) << 14) | ((x) >> 18))

#define ROR17(x) (((x) << 15) | ((x) >> 17))
#define ROR19(x) (((x) << 13) | ((x) >> 19))

#define SCHEDULE0()  \
                schedule0 = schedule16 + schedule25 \
                        + LOP3LUT_XOR(ROR7(schedule17) , ROR18(schedule17) , (schedule17 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule30) , ROR19(schedule30) , (schedule30 >> 10));


#define SCHEDULE1()  \
                schedule1 = schedule17 + schedule26 \
                        + LOP3LUT_XOR(ROR7(schedule18) , ROR18(schedule18) , (schedule18 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule31) , ROR19(schedule31) , (schedule31 >> 10));


#define SCHEDULE2()  \
                schedule2 = schedule18 + schedule27 \
                        + LOP3LUT_XOR(ROR7(schedule19) , ROR18(schedule19) , (schedule19 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule0) , ROR19(schedule0) , (schedule0 >> 10));


#define SCHEDULE3()  \
                schedule3 = schedule19 + schedule28 \
                        + LOP3LUT_XOR(ROR7(schedule20) , ROR18(schedule20) , (schedule20 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule1) , ROR19(schedule1) , (schedule1 >> 10));


#define SCHEDULE4()  \
                schedule4 = schedule20 + schedule29 \
                        + LOP3LUT_XOR(ROR7(schedule21) , ROR18(schedule21) , (schedule21 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule2) , ROR19(schedule2) , (schedule2 >> 10));


#define SCHEDULE5()  \
                schedule5 = schedule21 + schedule30 \
                        + LOP3LUT_XOR(ROR7(schedule22) , ROR18(schedule22) , (schedule22 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule3) , ROR19(schedule3) , (schedule3 >> 10));


#define SCHEDULE6()  \
                schedule6 = schedule22 + schedule31 \
                        + LOP3LUT_XOR(ROR7(schedule23) , ROR18(schedule23) , (schedule23 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule4) , ROR19(schedule4) , (schedule4 >> 10));


#define SCHEDULE7()  \
                schedule7 = schedule23 + schedule0 \
                        + LOP3LUT_XOR(ROR7(schedule24) , ROR18(schedule24) , (schedule24 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule5) , ROR19(schedule5) , (schedule5 >> 10));


#define SCHEDULE8()  \
                schedule8 = schedule24 + schedule1 \
                        + LOP3LUT_XOR(ROR7(schedule25) , ROR18(schedule25) , (schedule25 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule6) , ROR19(schedule6) , (schedule6 >> 10));


#define SCHEDULE9()  \
                schedule9 = schedule25 + schedule2 \
                        + LOP3LUT_XOR(ROR7(schedule26) , ROR18(schedule26) , (schedule26 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule7) , ROR19(schedule7) , (schedule7 >> 10));


#define SCHEDULE10()  \
                schedule10 = schedule26 + schedule3 \
                        + LOP3LUT_XOR(ROR7(schedule27) , ROR18(schedule27) , (schedule27 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule8) , ROR19(schedule8) , (schedule8 >> 10));


#define SCHEDULE11()  \
                schedule11 = schedule27 + schedule4 \
                        + LOP3LUT_XOR(ROR7(schedule28) , ROR18(schedule28) , (schedule28 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule9) , ROR19(schedule9) , (schedule9 >> 10));


#define SCHEDULE12()  \
                schedule12 = schedule28 + schedule5 \
                        + LOP3LUT_XOR(ROR7(schedule29) , ROR18(schedule29) , (schedule29 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule10) , ROR19(schedule10) , (schedule10 >> 10));


#define SCHEDULE13()  \
                schedule13 = schedule29 + schedule6 \
                        + LOP3LUT_XOR(ROR7(schedule30) , ROR18(schedule30) , (schedule30 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule11) , ROR19(schedule11) , (schedule11 >> 10));


#define SCHEDULE14()  \
                schedule14 = schedule30 + schedule7 \
                        + LOP3LUT_XOR(ROR7(schedule31) , ROR18(schedule31) , (schedule31 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule12) , ROR19(schedule12) , (schedule12 >> 10));


#define SCHEDULE15()  \
                schedule15 = schedule31 + schedule8 \
                        + LOP3LUT_XOR(ROR7(schedule0) , ROR18(schedule0) , (schedule0 >> 3)) \
                        + LOP3LUT_XOR(ROR17(schedule13) , ROR19(schedule13) , (schedule13 >> 10));

#define SCHEDULE16()  \
                schedule16 = schedule0 + schedule9  \
                        + LOP3LUT_XOR( ROR7(schedule1), ROR18(schedule1), (schedule1 >> 3))  \
                        + LOP3LUT_XOR( ROR17(schedule14), ROR19(schedule14), (schedule14 >> 10));

#define SCHEDULE17()  \
                schedule17 = schedule1 + schedule10  \
                        + LOP3LUT_XOR(ROR7(schedule2) , ROR18(schedule2) , (schedule2 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule15) , ROR19(schedule15) , (schedule15 >> 10));

#define SCHEDULE18()  \
                schedule18 = schedule2 + schedule11  \
                        + LOP3LUT_XOR(ROR7(schedule3) ,ROR18(schedule3) ,(schedule3 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule16), ROR19(schedule16), (schedule16 >> 10));
#define SCHEDULE19()  \
                schedule19 = schedule3 + schedule12  \
                        + LOP3LUT_XOR(ROR7(schedule4) , ROR18(schedule4) , (schedule4 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule17) , ROR19(schedule17) , (schedule17 >> 10));

#define SCHEDULE20()  \
                schedule20 = schedule4 + schedule13  \
                        + LOP3LUT_XOR(ROR7(schedule5) , ROR18(schedule5) , (schedule5 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule18) , ROR19(schedule18) , (schedule18 >> 10));

#define SCHEDULE21()  \
                schedule21 = schedule5 + schedule14  \
                        + LOP3LUT_XOR(ROR7(schedule6) , ROR18(schedule6) , (schedule6 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule19) , ROR19(schedule19) , (schedule19 >> 10));

#define SCHEDULE22()  \
                schedule22 = schedule6 + schedule15  \
                        + LOP3LUT_XOR(ROR7(schedule7) , ROR18(schedule7) , (schedule7 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule20) , ROR19(schedule20) , (schedule20 >> 10));

#define SCHEDULE23()  \
                schedule23 = schedule7 + schedule16  \
                        + LOP3LUT_XOR(ROR7(schedule8) , ROR18(schedule8) , (schedule8 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule21) , ROR19(schedule21) , (schedule21 >> 10));

#define SCHEDULE24()  \
                schedule24 = schedule8 + schedule17  \
                        + LOP3LUT_XOR(ROR7(schedule9) , ROR18(schedule9) , (schedule9 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule22) , ROR19(schedule22) , (schedule22 >> 10));

#define SCHEDULE25()  \
                schedule25 = schedule9 + schedule18  \
                        + LOP3LUT_XOR(ROR7(schedule10) , ROR18(schedule10) , (schedule10 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule23) , ROR19(schedule23) , (schedule23 >> 10));

#define SCHEDULE26()  \
                schedule26 = schedule10 + schedule19  \
                        + LOP3LUT_XOR(ROR7(schedule11) , ROR18(schedule11) , (schedule11 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule24) , ROR19(schedule24) , (schedule24 >> 10));

#define SCHEDULE27()  \
                schedule27 = schedule11 + schedule20  \
                        + LOP3LUT_XOR(ROR7(schedule12) , ROR18(schedule12) , (schedule12 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule25) , ROR19(schedule25) , (schedule25 >> 10));

#define SCHEDULE28()  \
                schedule28 = schedule12 + schedule21  \
                        + LOP3LUT_XOR(ROR7(schedule13) , ROR18(schedule13) , (schedule13 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule26) , ROR19(schedule26) , (schedule26 >> 10));

#define SCHEDULE29()  \
                schedule29 = schedule13 + schedule22  \
                        + LOP3LUT_XOR(ROR7(schedule14) , ROR18(schedule14) , (schedule14 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule27) , ROR19(schedule27) , (schedule27 >> 10));

#define SCHEDULE30()  \
                schedule30 = schedule14 + schedule23  \
                        + LOP3LUT_XOR(ROR7(schedule15) , ROR18(schedule15) , (schedule15 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule28) , ROR19(schedule28) , (schedule28 >> 10));

#define SCHEDULE31()  \
                schedule31 = schedule15 + schedule24  \
                        + LOP3LUT_XOR(ROR7(schedule16) , ROR18(schedule16) , (schedule16 >> 3))  \
                        + LOP3LUT_XOR(ROR17(schedule29) , ROR19(schedule29) , (schedule29 >> 10));

#define ALL_SCHEDULE32() \
                SCHEDULE0() \
                SCHEDULE1() \
                SCHEDULE2() \
                SCHEDULE3() \
                SCHEDULE4() \
                SCHEDULE5() \
                SCHEDULE6() \
                SCHEDULE7() \
                SCHEDULE8() \
                SCHEDULE9() \
                SCHEDULE10() \
                SCHEDULE11() \
                SCHEDULE12() \
                SCHEDULE13() \
                SCHEDULE14() \
                SCHEDULE15() \
                SCHEDULE16() \
                SCHEDULE17() \
                SCHEDULE18() \
                SCHEDULE19() \
                SCHEDULE20() \
                SCHEDULE21() \
                SCHEDULE22() \
                SCHEDULE23() \
                SCHEDULE24() \
                SCHEDULE25() \
                SCHEDULE26() \
                SCHEDULE27() \
                SCHEDULE28() \
                SCHEDULE29() \
                SCHEDULE30() \
                SCHEDULE31() 

#define ALL_SCHEDULE_LAST16() \
                SCHEDULE16() \
                SCHEDULE17() \
                SCHEDULE18() \
                SCHEDULE19() \
                SCHEDULE20() \
                SCHEDULE21() \
                SCHEDULE22() \
                SCHEDULE23() \
                SCHEDULE24() \
                SCHEDULE25() \
                SCHEDULE26() \
                SCHEDULE27() \
                SCHEDULE28() \
                SCHEDULE29() \
                SCHEDULE30() \
                SCHEDULE31() 

#define ROR6(x) (((x) << 26) | ((x) >> 6))
#define ROR11(x) (((x) << 21) | ((x) >> 11))
#define ROR25(x) (((x) << 7) | ((x) >> 25))

#define ROR2(x) (((x) << 30) | ((x) >> 2))
#define ROR13(x) (((x) << 19) | ((x) >> 13))
#define ROR22(x) (((x) << 10) | ((x) >> 22))

#define ROUND(a, b, c, d, e, f, g, h, W, k) \
                h += LOP3LUT_XOR(ROR6(e), ROR11(e), ROR25(e)) + LOP3LUT_XORAND(g,e,f) + k + W; \
                d += h;  \
                h += LOP3LUT_XOR(ROR2(a), ROR13(a), ROR22(a)) + LOP3LUT_ANDOR(a,b,c); /*((a & (b | c)) | (b & c)); */

#define ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, i, k, indexW) \
                h += LOP3LUT_XOR(ROR6(e), ROR11(e), ROR25(e)) + LOP3LUT_XORAND(g,e,f) + k +  w_blocks_d[indexW+i]; \
                d += h;  \
                h += LOP3LUT_XOR(ROR2(a), ROR13(a), ROR22(a)) + LOP3LUT_ANDOR(a,b,c);

unsigned int LOP3LUT_XOR(unsigned int a, unsigned int b, unsigned int c) {
        #if DEV_NVIDIA_SM50 == 1
                unsigned int d;
                asm("lop3.b32 %0, %1, %2, %3, 0x96;" : "=r"(d) : "r"(a), "r"(b), "r"(c));
                return d;
        #else
            return a^b^c;
        #endif
}

unsigned int LOP3LUT_XORAND(unsigned int a, unsigned int b, unsigned int c) {
        #if DEV_NVIDIA_SM50 == 1
                unsigned int d;
                asm("lop3.b32 %0, %1, %2, %3, 0xb8;" : "=r"(d) : "r"(a), "r"(b), "r"(c));
                return d;
        #else
                return (a ^ (b & (c ^ a)));
        #endif
}

unsigned int LOP3LUT_ANDOR(unsigned int a, unsigned int b, unsigned int c) {
        #if DEV_NVIDIA_SM50 == 1
                unsigned int d;
                asm("lop3.b32 %0, %1, %2, %3, 0xe8;" : "=r"(d) : "r"(a), "r"(b), "r"(c));
                return d;
        #else
                return  ((a & (b | c)) | (b & c));

        #endif
}

__kernel void opencl_bitcracker_attack(int numPassword, __global unsigned char *w_password,
							__global int *found, __global unsigned char * vmkKey, 
							__global unsigned int *w_blocks_d,
                                                        unsigned int IV0, unsigned int IV4,
                                                        unsigned int IV8, unsigned int IV12)
{
        unsigned int schedule0, schedule1, schedule2, schedule3, schedule4, schedule5, schedule6, schedule7, schedule8, schedule9;
        unsigned int schedule10, schedule11, schedule12, schedule13, schedule14, schedule15, schedule16, schedule17, schedule18, schedule19;
        unsigned int schedule20, schedule21, schedule22, schedule23, schedule24, schedule25, schedule26, schedule27, schedule28, schedule29;
        unsigned int schedule30, schedule31;
        unsigned int first_hash0, first_hash1, first_hash2, first_hash3, first_hash4, first_hash5, first_hash6, first_hash7;
        unsigned int hash0, hash1, hash2, hash3, hash4, hash5, hash6, hash7;
        unsigned int a, b, c, d, e, f, g, h;
        
        int gIndex = (int)get_global_id(0);
	int index_generic;
	int indexW=(gIndex*FIXED_PASSWORD_BUFFER);
        int curr_fetch=0;

	while(gIndex < numPassword)
	{
		first_hash0 = 0x6A09E667;
		first_hash1 = 0xBB67AE85;
		first_hash2 = 0x3C6EF372;
		first_hash3 = 0xA54FF53A;
		first_hash4 = 0x510E527F;
		first_hash5 = 0x9B05688C;
		first_hash6 = 0x1F83D9AB;
		first_hash7 = 0x5BE0CD19;

                //----------------------------------------------------- FIRST HASH ------------------------------------------------
		a = 0x6A09E667;
		b = 0xBB67AE85;
		c = 0x3C6EF372;
		d = 0xA54FF53A;
		e = 0x510E527F;
		f = 0x9B05688C;
		g = 0x1F83D9AB;
		h = 0x5BE0CD19;

                indexW=(gIndex*FIXED_PASSWORD_BUFFER);
                curr_fetch=0;
                index_generic=MAX_INPUT_PASSWORD_LEN;

		//--------------------- SCHEDULE -------------------
                schedule0 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                curr_fetch+=2;
                schedule1 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                curr_fetch+=2;
                schedule2 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                curr_fetch+=2;
                schedule3 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                curr_fetch+=2;

                schedule4 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                if((unsigned int)w_password[(indexW+curr_fetch)] == END_STRING) { index_generic=curr_fetch;  }
                if((unsigned int)w_password[(indexW+curr_fetch+1)] == END_STRING) { index_generic=curr_fetch+1;  }
                curr_fetch+=2;

                schedule5 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                if((unsigned int)w_password[(indexW+curr_fetch)] == END_STRING) { index_generic=curr_fetch; }
                if((unsigned int)w_password[(indexW+curr_fetch+1)] == END_STRING) { index_generic=curr_fetch+1; }
                curr_fetch+=2;

                schedule6 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                if((unsigned int)w_password[(indexW+curr_fetch)] == END_STRING) { index_generic=curr_fetch;  }
                if((unsigned int)w_password[(indexW+curr_fetch+1)] == END_STRING) { index_generic=curr_fetch+1;  }
                curr_fetch+=2;

                schedule7 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                if((unsigned int)w_password[(indexW+curr_fetch)] == END_STRING) { index_generic=curr_fetch;  }
                if((unsigned int)w_password[(indexW+curr_fetch+1)] == END_STRING) { index_generic=curr_fetch+1;  }
                curr_fetch+=2;

                schedule8 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                if((unsigned int)w_password[(indexW+curr_fetch)] == END_STRING) { index_generic=curr_fetch;  }
                if((unsigned int)w_password[(indexW+curr_fetch+1)] == END_STRING) { index_generic=curr_fetch+1;  }
                curr_fetch+=2;

                schedule9 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                if((unsigned int)w_password[(indexW+curr_fetch)] == END_STRING) { index_generic=curr_fetch;  }
                if((unsigned int)w_password[(indexW+curr_fetch+1)] == END_STRING) { index_generic=curr_fetch+1;  }
                curr_fetch+=2;

                schedule10 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                if((unsigned int)w_password[(indexW+curr_fetch)] == END_STRING) { index_generic=curr_fetch;  }
                if((unsigned int)w_password[(indexW+curr_fetch+1)] == END_STRING) { index_generic=curr_fetch+1;  }
                curr_fetch+=2;

                schedule11 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                if((unsigned int)w_password[(indexW+curr_fetch)] == END_STRING) { index_generic=curr_fetch;  }
                if((unsigned int)w_password[(indexW+curr_fetch+1)] == END_STRING) { index_generic=curr_fetch+1;  }
                curr_fetch+=2;

                schedule12 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                if((unsigned int)w_password[(indexW+curr_fetch)] == END_STRING) { index_generic=curr_fetch;  }
                if((unsigned int)w_password[(indexW+curr_fetch+1)] == END_STRING) { index_generic=curr_fetch+1;  }
                curr_fetch+=2;

                schedule13 = ((unsigned int)w_password[(indexW+curr_fetch)] << 24) | 0 | ((unsigned int)w_password[(indexW+curr_fetch+1)] <<  8) | 0;
                if((unsigned int)w_password[(indexW+curr_fetch)] == END_STRING) { index_generic=curr_fetch;  }
                if((unsigned int)w_password[(indexW+curr_fetch+1)] == END_STRING) { index_generic=curr_fetch+1;  }

                if(index_generic == MAX_INPUT_PASSWORD_LEN) schedule13 = schedule13 | ((unsigned int)0x8000);
                schedule14=0;
                index_generic*=2;
                schedule15 = ((unsigned char)((index_generic << 3) >> 8)) << 8 | ((unsigned char)(index_generic << 3));

		//-----------------------------------------------         

		ALL_SCHEDULE_LAST16()

		ROUND(a, b, c, d, e, f, g, h,  schedule0, 0x428A2F98)
		ROUND(h, a, b, c, d, e, f, g,  schedule1, 0x71374491)
		ROUND(g, h, a, b, c, d, e, f,  schedule2, 0xB5C0FBCF)
		ROUND(f, g, h, a, b, c, d, e,  schedule3, 0xE9B5DBA5)
		ROUND(e, f, g, h, a, b, c, d,  schedule4, 0x3956C25B)
		ROUND(d, e, f, g, h, a, b, c,  schedule5, 0x59F111F1)
		ROUND(c, d, e, f, g, h, a, b,  schedule6, 0x923F82A4)
		ROUND(b, c, d, e, f, g, h, a,  schedule7, 0xAB1C5ED5)
		ROUND(a, b, c, d, e, f, g, h,  schedule8, 0xD807AA98)
		ROUND(h, a, b, c, d, e, f, g,  schedule9, 0x12835B01)
		ROUND(g, h, a, b, c, d, e, f, schedule10, 0x243185BE)
		ROUND(f, g, h, a, b, c, d, e, schedule11, 0x550C7DC3)
		ROUND(e, f, g, h, a, b, c, d, schedule12, 0x72BE5D74)
		ROUND(d, e, f, g, h, a, b, c, schedule13, 0x80DEB1FE)
		ROUND(c, d, e, f, g, h, a, b, schedule14, 0x9BDC06A7)
		ROUND(b, c, d, e, f, g, h, a, schedule15, 0xC19BF174)
		ROUND(a, b, c, d, e, f, g, h, schedule16, 0xE49B69C1)
		ROUND(h, a, b, c, d, e, f, g, schedule17, 0xEFBE4786)
		ROUND(g, h, a, b, c, d, e, f, schedule18, 0x0FC19DC6)
		ROUND(f, g, h, a, b, c, d, e, schedule19, 0x240CA1CC)
		ROUND(e, f, g, h, a, b, c, d, schedule20, 0x2DE92C6F)
		ROUND(d, e, f, g, h, a, b, c, schedule21, 0x4A7484AA)
		ROUND(c, d, e, f, g, h, a, b, schedule22, 0x5CB0A9DC)
		ROUND(b, c, d, e, f, g, h, a, schedule23, 0x76F988DA)
		ROUND(a, b, c, d, e, f, g, h, schedule24, 0x983E5152)
		ROUND(h, a, b, c, d, e, f, g, schedule25, 0xA831C66D)
		ROUND(g, h, a, b, c, d, e, f, schedule26, 0xB00327C8)
		ROUND(f, g, h, a, b, c, d, e, schedule27, 0xBF597FC7)
		ROUND(e, f, g, h, a, b, c, d, schedule28, 0xC6E00BF3)
		ROUND(d, e, f, g, h, a, b, c, schedule29, 0xD5A79147)
		ROUND(c, d, e, f, g, h, a, b, schedule30, 0x06CA6351)
		ROUND(b, c, d, e, f, g, h, a, schedule31, 0x14292967)

		ALL_SCHEDULE32()

		ROUND(a, b, c, d, e, f, g, h, schedule0, 0x27B70A85)
		ROUND(h, a, b, c, d, e, f, g, schedule1, 0x2E1B2138)
		ROUND(g, h, a, b, c, d, e, f, schedule2, 0x4D2C6DFC)
		ROUND(f, g, h, a, b, c, d, e, schedule3, 0x53380D13)
		ROUND(e, f, g, h, a, b, c, d, schedule4, 0x650A7354)
		ROUND(d, e, f, g, h, a, b, c, schedule5, 0x766A0ABB)
		ROUND(c, d, e, f, g, h, a, b, schedule6, 0x81C2C92E)
		ROUND(b, c, d, e, f, g, h, a, schedule7, 0x92722C85)
		ROUND(a, b, c, d, e, f, g, h, schedule8, 0xA2BFE8A1)
		ROUND(h, a, b, c, d, e, f, g, schedule9, 0xA81A664B)
		ROUND(g, h, a, b, c, d, e, f, schedule10, 0xC24B8B70)
		ROUND(f, g, h, a, b, c, d, e, schedule11, 0xC76C51A3)
		ROUND(e, f, g, h, a, b, c, d, schedule12, 0xD192E819)
		ROUND(d, e, f, g, h, a, b, c, schedule13, 0xD6990624)
		ROUND(c, d, e, f, g, h, a, b, schedule14, 0xF40E3585)
		ROUND(b, c, d, e, f, g, h, a, schedule15, 0x106AA070)
		ROUND(a, b, c, d, e, f, g, h, schedule16, 0x19A4C116)
		ROUND(h, a, b, c, d, e, f, g, schedule17, 0x1E376C08)
		ROUND(g, h, a, b, c, d, e, f, schedule18, 0x2748774C)
		ROUND(f, g, h, a, b, c, d, e, schedule19, 0x34B0BCB5)
		ROUND(e, f, g, h, a, b, c, d, schedule20, 0x391C0CB3)
		ROUND(d, e, f, g, h, a, b, c, schedule21, 0x4ED8AA4A)
		ROUND(c, d, e, f, g, h, a, b, schedule22, 0x5B9CCA4F)
		ROUND(b, c, d, e, f, g, h, a, schedule23, 0x682E6FF3)
		ROUND(a, b, c, d, e, f, g, h, schedule24, 0x748F82EE)
		ROUND(h, a, b, c, d, e, f, g, schedule25, 0x78A5636F)
		ROUND(g, h, a, b, c, d, e, f, schedule26, 0x84C87814)
		ROUND(f, g, h, a, b, c, d, e, schedule27, 0x8CC70208)
		ROUND(e, f, g, h, a, b, c, d, schedule28, 0x90BEFFFA)
		ROUND(d, e, f, g, h, a, b, c, schedule29, 0xA4506CEB)
		ROUND(c, d, e, f, g, h, a, b, schedule30, 0xBEF9A3F7)
		ROUND(b, c, d, e, f, g, h, a, schedule31, 0xC67178F2)
		
		first_hash0 += a;
		first_hash1 += b;
		first_hash2 += c;
		first_hash3 += d;
		first_hash4 += e;
		first_hash5 += f;
		first_hash6 += g;
		first_hash7 += h;

//----------------------------------------------------- SECOND HASH ------------------------------------------------
		schedule0 = first_hash0;
		schedule1 = first_hash1;
		schedule2 = first_hash2;
		schedule3 = first_hash3;
		schedule4 = first_hash4;
		schedule5 = first_hash5;
		schedule6 = first_hash6;
		schedule7 = first_hash7;
		schedule8 = 0x80000000;
		schedule9 = 0;
		schedule10 = 0;
		schedule11 = 0;
		schedule12 = 0;
		schedule13 = 0;
		schedule14 = 0;
		schedule15 = 0x100;

		first_hash0 = 0x6A09E667;
		first_hash1 = 0xBB67AE85;
		first_hash2 = 0x3C6EF372;
		first_hash3 = 0xA54FF53A;
		first_hash4 = 0x510E527F;
		first_hash5 = 0x9B05688C;
		first_hash6 = 0x1F83D9AB;
		first_hash7 = 0x5BE0CD19;

		a = first_hash0;
		b = first_hash1;
		c = first_hash2;
		d = first_hash3;
		e = first_hash4;
		f = first_hash5;
		g = first_hash6;
		h = first_hash7;

		ALL_SCHEDULE_LAST16()

		ROUND(a, b, c, d, e, f, g, h,  schedule0, 0x428A2F98)
		ROUND(h, a, b, c, d, e, f, g,  schedule1, 0x71374491)
		ROUND(g, h, a, b, c, d, e, f,  schedule2, 0xB5C0FBCF)
		ROUND(f, g, h, a, b, c, d, e,  schedule3, 0xE9B5DBA5)
		ROUND(e, f, g, h, a, b, c, d,  schedule4, 0x3956C25B)
		ROUND(d, e, f, g, h, a, b, c,  schedule5, 0x59F111F1)
		ROUND(c, d, e, f, g, h, a, b,  schedule6, 0x923F82A4)
		ROUND(b, c, d, e, f, g, h, a,  schedule7, 0xAB1C5ED5)
		ROUND(a, b, c, d, e, f, g, h,  schedule8, 0xD807AA98)
		ROUND(h, a, b, c, d, e, f, g,  schedule9, 0x12835B01)
		ROUND(g, h, a, b, c, d, e, f, schedule10, 0x243185BE)
		ROUND(f, g, h, a, b, c, d, e, schedule11, 0x550C7DC3)
		ROUND(e, f, g, h, a, b, c, d, schedule12, 0x72BE5D74)
		ROUND(d, e, f, g, h, a, b, c, schedule13, 0x80DEB1FE)
		ROUND(c, d, e, f, g, h, a, b, schedule14, 0x9BDC06A7)
		ROUND(b, c, d, e, f, g, h, a, schedule15, 0xC19BF174)
		ROUND(a, b, c, d, e, f, g, h, schedule16, 0xE49B69C1)
		ROUND(h, a, b, c, d, e, f, g, schedule17, 0xEFBE4786)
		ROUND(g, h, a, b, c, d, e, f, schedule18, 0x0FC19DC6)
		ROUND(f, g, h, a, b, c, d, e, schedule19, 0x240CA1CC)
		ROUND(e, f, g, h, a, b, c, d, schedule20, 0x2DE92C6F)
		ROUND(d, e, f, g, h, a, b, c, schedule21, 0x4A7484AA)
		ROUND(c, d, e, f, g, h, a, b, schedule22, 0x5CB0A9DC)
		ROUND(b, c, d, e, f, g, h, a, schedule23, 0x76F988DA)
		ROUND(a, b, c, d, e, f, g, h, schedule24, 0x983E5152)
		ROUND(h, a, b, c, d, e, f, g, schedule25, 0xA831C66D)
		ROUND(g, h, a, b, c, d, e, f, schedule26, 0xB00327C8)
		ROUND(f, g, h, a, b, c, d, e, schedule27, 0xBF597FC7)
		ROUND(e, f, g, h, a, b, c, d, schedule28, 0xC6E00BF3)
		ROUND(d, e, f, g, h, a, b, c, schedule29, 0xD5A79147)
		ROUND(c, d, e, f, g, h, a, b, schedule30, 0x06CA6351)
		ROUND(b, c, d, e, f, g, h, a, schedule31, 0x14292967)

		ALL_SCHEDULE32()

		ROUND(a, b, c, d, e, f, g, h, schedule0, 0x27B70A85)
		ROUND(h, a, b, c, d, e, f, g, schedule1, 0x2E1B2138)
		ROUND(g, h, a, b, c, d, e, f, schedule2, 0x4D2C6DFC)
		ROUND(f, g, h, a, b, c, d, e, schedule3, 0x53380D13)
		ROUND(e, f, g, h, a, b, c, d, schedule4, 0x650A7354)
		ROUND(d, e, f, g, h, a, b, c, schedule5, 0x766A0ABB)
		ROUND(c, d, e, f, g, h, a, b, schedule6, 0x81C2C92E)
		ROUND(b, c, d, e, f, g, h, a, schedule7, 0x92722C85)
		ROUND(a, b, c, d, e, f, g, h, schedule8, 0xA2BFE8A1)
		ROUND(h, a, b, c, d, e, f, g, schedule9, 0xA81A664B)
		ROUND(g, h, a, b, c, d, e, f, schedule10, 0xC24B8B70)
		ROUND(f, g, h, a, b, c, d, e, schedule11, 0xC76C51A3)
		ROUND(e, f, g, h, a, b, c, d, schedule12, 0xD192E819)
		ROUND(d, e, f, g, h, a, b, c, schedule13, 0xD6990624)
		ROUND(c, d, e, f, g, h, a, b, schedule14, 0xF40E3585)
		ROUND(b, c, d, e, f, g, h, a, schedule15, 0x106AA070)
		ROUND(a, b, c, d, e, f, g, h, schedule16, 0x19A4C116)
		ROUND(h, a, b, c, d, e, f, g, schedule17, 0x1E376C08)
		ROUND(g, h, a, b, c, d, e, f, schedule18, 0x2748774C)
		ROUND(f, g, h, a, b, c, d, e, schedule19, 0x34B0BCB5)
		ROUND(e, f, g, h, a, b, c, d, schedule20, 0x391C0CB3)
		ROUND(d, e, f, g, h, a, b, c, schedule21, 0x4ED8AA4A)
		ROUND(c, d, e, f, g, h, a, b, schedule22, 0x5B9CCA4F)
		ROUND(b, c, d, e, f, g, h, a, schedule23, 0x682E6FF3)
		ROUND(a, b, c, d, e, f, g, h, schedule24, 0x748F82EE)
		ROUND(h, a, b, c, d, e, f, g, schedule25, 0x78A5636F)
		ROUND(g, h, a, b, c, d, e, f, schedule26, 0x84C87814)
		ROUND(f, g, h, a, b, c, d, e, schedule27, 0x8CC70208)
		ROUND(e, f, g, h, a, b, c, d, schedule28, 0x90BEFFFA)
		ROUND(d, e, f, g, h, a, b, c, schedule29, 0xA4506CEB)
		ROUND(c, d, e, f, g, h, a, b, schedule30, 0xBEF9A3F7)
		ROUND(b, c, d, e, f, g, h, a, schedule31, 0xC67178F2)
		
		first_hash0 += a;
		first_hash1 += b;
		first_hash2 += c;
		first_hash3 += d;
		first_hash4 += e;
		first_hash5 += f;
		first_hash6 += g;
		first_hash7 += h;

//----------------------------------------------------- LOOP HASH ------------------------------------------------
		
		hash0=0;
		hash1=0;
		hash2=0;
		hash3=0;
		hash4=0;
		hash5=0;
		hash6=0;
		hash7=0;

		indexW=0;
	
        	for(index_generic=0; index_generic < ITERATION_NUMBER/2; index_generic++)
		{
			a = 0x6A09E667;
			b = 0xBB67AE85;
			c = 0x3C6EF372;
			d = 0xA54FF53A;
			e = 0x510E527F;
			f = 0x9B05688C;
			g = 0x1F83D9AB;
			h = 0x5BE0CD19;

			schedule0 = hash0;
			schedule1 = hash1;
			schedule2 = hash2;
			schedule3 = hash3;
			schedule4 = hash4;
			schedule5 = hash5;
			schedule6 = hash6;
			schedule7 = hash7;

			schedule8 = first_hash0;
			schedule9 = first_hash1;
			schedule10 = first_hash2;
			schedule11 = first_hash3;
			schedule12 = first_hash4;
			schedule13 = first_hash5;
			schedule14 = first_hash6;
			schedule15 = first_hash7;

			ALL_SCHEDULE_LAST16()

			ROUND(a, b, c, d, e, f, g, h,  schedule0, 0x428A2F98)
			ROUND(h, a, b, c, d, e, f, g,  schedule1, 0x71374491)
			ROUND(g, h, a, b, c, d, e, f,  schedule2, 0xB5C0FBCF)
			ROUND(f, g, h, a, b, c, d, e,  schedule3, 0xE9B5DBA5)
			ROUND(e, f, g, h, a, b, c, d,  schedule4, 0x3956C25B)
			ROUND(d, e, f, g, h, a, b, c,  schedule5, 0x59F111F1)
			ROUND(c, d, e, f, g, h, a, b,  schedule6, 0x923F82A4)
			ROUND(b, c, d, e, f, g, h, a,  schedule7, 0xAB1C5ED5)
			ROUND(a, b, c, d, e, f, g, h,  schedule8, 0xD807AA98)
			ROUND(h, a, b, c, d, e, f, g,  schedule9, 0x12835B01)
			ROUND(g, h, a, b, c, d, e, f, schedule10, 0x243185BE)
			ROUND(f, g, h, a, b, c, d, e, schedule11, 0x550C7DC3)
			ROUND(e, f, g, h, a, b, c, d, schedule12, 0x72BE5D74)
			ROUND(d, e, f, g, h, a, b, c, schedule13, 0x80DEB1FE)
			ROUND(c, d, e, f, g, h, a, b, schedule14, 0x9BDC06A7)
			ROUND(b, c, d, e, f, g, h, a, schedule15, 0xC19BF174)
			ROUND(a, b, c, d, e, f, g, h, schedule16, 0xE49B69C1)
			ROUND(h, a, b, c, d, e, f, g, schedule17, 0xEFBE4786)
			ROUND(g, h, a, b, c, d, e, f, schedule18, 0x0FC19DC6)
			ROUND(f, g, h, a, b, c, d, e, schedule19, 0x240CA1CC)
			ROUND(e, f, g, h, a, b, c, d, schedule20, 0x2DE92C6F)
			ROUND(d, e, f, g, h, a, b, c, schedule21, 0x4A7484AA)
			ROUND(c, d, e, f, g, h, a, b, schedule22, 0x5CB0A9DC)
			ROUND(b, c, d, e, f, g, h, a, schedule23, 0x76F988DA)
			ROUND(a, b, c, d, e, f, g, h, schedule24, 0x983E5152)
			ROUND(h, a, b, c, d, e, f, g, schedule25, 0xA831C66D)
			ROUND(g, h, a, b, c, d, e, f, schedule26, 0xB00327C8)
			ROUND(f, g, h, a, b, c, d, e, schedule27, 0xBF597FC7)
			ROUND(e, f, g, h, a, b, c, d, schedule28, 0xC6E00BF3)
			ROUND(d, e, f, g, h, a, b, c, schedule29, 0xD5A79147)
			ROUND(c, d, e, f, g, h, a, b, schedule30, 0x06CA6351)
			ROUND(b, c, d, e, f, g, h, a, schedule31, 0x14292967)

			ALL_SCHEDULE32()

			ROUND(a, b, c, d, e, f, g, h, schedule0, 0x27B70A85)
			ROUND(h, a, b, c, d, e, f, g, schedule1, 0x2E1B2138)
			ROUND(g, h, a, b, c, d, e, f, schedule2, 0x4D2C6DFC)
			ROUND(f, g, h, a, b, c, d, e, schedule3, 0x53380D13)
			ROUND(e, f, g, h, a, b, c, d, schedule4, 0x650A7354)
			ROUND(d, e, f, g, h, a, b, c, schedule5, 0x766A0ABB)
			ROUND(c, d, e, f, g, h, a, b, schedule6, 0x81C2C92E)
			ROUND(b, c, d, e, f, g, h, a, schedule7, 0x92722C85)
			ROUND(a, b, c, d, e, f, g, h, schedule8, 0xA2BFE8A1)
			ROUND(h, a, b, c, d, e, f, g, schedule9, 0xA81A664B)
			ROUND(g, h, a, b, c, d, e, f, schedule10, 0xC24B8B70)
			ROUND(f, g, h, a, b, c, d, e, schedule11, 0xC76C51A3)
			ROUND(e, f, g, h, a, b, c, d, schedule12, 0xD192E819)
			ROUND(d, e, f, g, h, a, b, c, schedule13, 0xD6990624)
			ROUND(c, d, e, f, g, h, a, b, schedule14, 0xF40E3585)
			ROUND(b, c, d, e, f, g, h, a, schedule15, 0x106AA070)
			ROUND(a, b, c, d, e, f, g, h, schedule16, 0x19A4C116)
			ROUND(h, a, b, c, d, e, f, g, schedule17, 0x1E376C08)
			ROUND(g, h, a, b, c, d, e, f, schedule18, 0x2748774C)
			ROUND(f, g, h, a, b, c, d, e, schedule19, 0x34B0BCB5)
			ROUND(e, f, g, h, a, b, c, d, schedule20, 0x391C0CB3)
			ROUND(d, e, f, g, h, a, b, c, schedule21, 0x4ED8AA4A)
			ROUND(c, d, e, f, g, h, a, b, schedule22, 0x5B9CCA4F)
			ROUND(b, c, d, e, f, g, h, a, schedule23, 0x682E6FF3)
			ROUND(a, b, c, d, e, f, g, h, schedule24, 0x748F82EE)
			ROUND(h, a, b, c, d, e, f, g, schedule25, 0x78A5636F)
			ROUND(g, h, a, b, c, d, e, f, schedule26, 0x84C87814)
			ROUND(f, g, h, a, b, c, d, e, schedule27, 0x8CC70208)
			ROUND(e, f, g, h, a, b, c, d, schedule28, 0x90BEFFFA)
			ROUND(d, e, f, g, h, a, b, c, schedule29, 0xA4506CEB)
			ROUND(c, d, e, f, g, h, a, b, schedule30, 0xBEF9A3F7)
			ROUND(b, c, d, e, f, g, h, a, schedule31, 0xC67178F2)

			hash0 = 0x6A09E667 + a;
			hash1 = 0xBB67AE85 + b;
			hash2 = 0x3C6EF372 + c;
			hash3 = 0xA54FF53A + d;
			hash4 = 0x510E527F + e;
			hash5 = 0x9B05688C + f;
			hash6 = 0x1F83D9AB + g;
			hash7 = 0x5BE0CD19 + h;

			a = hash0;
			b = hash1;
			c = hash2;
			d = hash3;
			e = hash4;
			f = hash5;
			g = hash6;
			h = hash7;

			ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h,  0, 0x428A2F98, 0)
			ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g,  1, 0x71374491, 0)
			ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f,  2, 0xB5C0FBCF, 0)
			ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e,  3, 0xE9B5DBA5, 0)
			ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d,  4, 0x3956C25B, indexW)
			ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c,  5, 0x59F111F1, indexW)
			ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b,  6, 0x923F82A4, indexW)
			ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a,  7, 0xAB1C5ED5, indexW)
			ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h,  8, 0xD807AA98, indexW)
			ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g,  9, 0x12835B01, indexW)
			ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 10, 0x243185BE, indexW)
			ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 11, 0x550C7DC3, indexW)
			ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 12, 0x72BE5D74, indexW)
			ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 13, 0x80DEB1FE, indexW)
			ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 14, 0x9BDC06A7, indexW)
			ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 15, 0xC19BF174, indexW)
			ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 16, 0xE49B69C1, indexW)
			ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 17, 0xEFBE4786, indexW)
			ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 18, 0x0FC19DC6, indexW)
			ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 19, 0x240CA1CC, indexW)
			ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 20, 0x2DE92C6F, indexW)
			ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 21, 0x4A7484AA, indexW)
			ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 22, 0x5CB0A9DC, indexW)
			ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 23, 0x76F988DA, indexW)
			ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 24, 0x983E5152, indexW)
			ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 25, 0xA831C66D, indexW)
			ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 26, 0xB00327C8, indexW)
			ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 27, 0xBF597FC7, indexW)
			ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 28, 0xC6E00BF3, indexW)
			ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 29, 0xD5A79147, indexW)
			ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 30, 0x06CA6351, indexW)
			ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 31, 0x14292967, indexW)

			ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 32, 0x27B70A85, indexW)
			ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 33, 0x2E1B2138, indexW)
			ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 34, 0x4D2C6DFC, indexW)
			ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 35, 0x53380D13, indexW)
			ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 36, 0x650A7354, indexW)
			ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 37, 0x766A0ABB, indexW)
			ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 38, 0x81C2C92E, indexW)
			ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 39, 0x92722C85, indexW)
			ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 40, 0xA2BFE8A1, indexW)
			ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 41, 0xA81A664B, indexW)
			ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 42, 0xC24B8B70, indexW)
			ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 43, 0xC76C51A3, indexW)
			ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 44, 0xD192E819, indexW)
			ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 45, 0xD6990624, indexW)
			ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 46, 0xF40E3585, indexW)
			ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 47, 0x106AA070, indexW)
			ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 48, 0x19A4C116, indexW)
			ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 49, 0x1E376C08, indexW)
			ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 50, 0x2748774C, indexW)
			ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 51, 0x34B0BCB5, indexW)
			ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 52, 0x391C0CB3, indexW)
			ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 53, 0x4ED8AA4A, indexW)
			ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 54, 0x5B9CCA4F, indexW)
			ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 55, 0x682E6FF3, indexW)
			ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 56, 0x748F82EE, indexW)
			ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 57, 0x78A5636F, indexW)
			ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 58, 0x84C87814, indexW)
			ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 59, 0x8CC70208, indexW)
			ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 60, 0x90BEFFFA, indexW)
			ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 61, 0xA4506CEB, indexW)
			ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 62, 0xBEF9A3F7, indexW)
			ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 63, 0xC67178F2, indexW)
			
			hash0 += a;
			hash1 += b;
			hash2 += c;
			hash3 += d;
			hash4 += e;
			hash5 += f;
			hash6 += g;
			hash7 += h;

			indexW += SINGLE_BLOCK_W_SIZE;
		}

                for(index_generic=ITERATION_NUMBER/2; index_generic < ITERATION_NUMBER; index_generic++)
                {
                        a = 0x6A09E667;
                        b = 0xBB67AE85;
                        c = 0x3C6EF372;
                        d = 0xA54FF53A;
                        e = 0x510E527F;
                        f = 0x9B05688C;
                        g = 0x1F83D9AB;
                        h = 0x5BE0CD19;

                        schedule0 = hash0;
                        schedule1 = hash1;
                        schedule2 = hash2;
                        schedule3 = hash3;
                        schedule4 = hash4;
                        schedule5 = hash5;
                        schedule6 = hash6;
                        schedule7 = hash7;

                        schedule8 = first_hash0;
                        schedule9 = first_hash1;
                        schedule10 = first_hash2;
                        schedule11 = first_hash3;
                        schedule12 = first_hash4;
                        schedule13 = first_hash5;
                        schedule14 = first_hash6;
                        schedule15 = first_hash7;

                        ALL_SCHEDULE_LAST16()

                        ROUND(a, b, c, d, e, f, g, h,  schedule0, 0x428A2F98)
                        ROUND(h, a, b, c, d, e, f, g,  schedule1, 0x71374491)
                        ROUND(g, h, a, b, c, d, e, f,  schedule2, 0xB5C0FBCF)
                        ROUND(f, g, h, a, b, c, d, e,  schedule3, 0xE9B5DBA5)
                        ROUND(e, f, g, h, a, b, c, d,  schedule4, 0x3956C25B)
                        ROUND(d, e, f, g, h, a, b, c,  schedule5, 0x59F111F1)
                        ROUND(c, d, e, f, g, h, a, b,  schedule6, 0x923F82A4)
                        ROUND(b, c, d, e, f, g, h, a,  schedule7, 0xAB1C5ED5)
                        ROUND(a, b, c, d, e, f, g, h,  schedule8, 0xD807AA98)
                        ROUND(h, a, b, c, d, e, f, g,  schedule9, 0x12835B01)
                        ROUND(g, h, a, b, c, d, e, f, schedule10, 0x243185BE)
                        ROUND(f, g, h, a, b, c, d, e, schedule11, 0x550C7DC3)
                        ROUND(e, f, g, h, a, b, c, d, schedule12, 0x72BE5D74)
                        ROUND(d, e, f, g, h, a, b, c, schedule13, 0x80DEB1FE)
                        ROUND(c, d, e, f, g, h, a, b, schedule14, 0x9BDC06A7)
                        ROUND(b, c, d, e, f, g, h, a, schedule15, 0xC19BF174)
                        ROUND(a, b, c, d, e, f, g, h, schedule16, 0xE49B69C1)
                        ROUND(h, a, b, c, d, e, f, g, schedule17, 0xEFBE4786)
                        ROUND(g, h, a, b, c, d, e, f, schedule18, 0x0FC19DC6)
                        ROUND(f, g, h, a, b, c, d, e, schedule19, 0x240CA1CC)
                        ROUND(e, f, g, h, a, b, c, d, schedule20, 0x2DE92C6F)
                        ROUND(d, e, f, g, h, a, b, c, schedule21, 0x4A7484AA)
                        ROUND(c, d, e, f, g, h, a, b, schedule22, 0x5CB0A9DC)
                        ROUND(b, c, d, e, f, g, h, a, schedule23, 0x76F988DA)
                        ROUND(a, b, c, d, e, f, g, h, schedule24, 0x983E5152)
                        ROUND(h, a, b, c, d, e, f, g, schedule25, 0xA831C66D)
                        ROUND(g, h, a, b, c, d, e, f, schedule26, 0xB00327C8)
                        ROUND(f, g, h, a, b, c, d, e, schedule27, 0xBF597FC7)
                        ROUND(e, f, g, h, a, b, c, d, schedule28, 0xC6E00BF3)
                        ROUND(d, e, f, g, h, a, b, c, schedule29, 0xD5A79147)
                        ROUND(c, d, e, f, g, h, a, b, schedule30, 0x06CA6351)
                        ROUND(b, c, d, e, f, g, h, a, schedule31, 0x14292967)

                        ALL_SCHEDULE32()

                        ROUND(a, b, c, d, e, f, g, h, schedule0, 0x27B70A85)
                        ROUND(h, a, b, c, d, e, f, g, schedule1, 0x2E1B2138)
                        ROUND(g, h, a, b, c, d, e, f, schedule2, 0x4D2C6DFC)
                        ROUND(f, g, h, a, b, c, d, e, schedule3, 0x53380D13)
                        ROUND(e, f, g, h, a, b, c, d, schedule4, 0x650A7354)
                        ROUND(d, e, f, g, h, a, b, c, schedule5, 0x766A0ABB)
                        ROUND(c, d, e, f, g, h, a, b, schedule6, 0x81C2C92E)
                        ROUND(b, c, d, e, f, g, h, a, schedule7, 0x92722C85)
                        ROUND(a, b, c, d, e, f, g, h, schedule8, 0xA2BFE8A1)
                        ROUND(h, a, b, c, d, e, f, g, schedule9, 0xA81A664B)
                        ROUND(g, h, a, b, c, d, e, f, schedule10, 0xC24B8B70)
                        ROUND(f, g, h, a, b, c, d, e, schedule11, 0xC76C51A3)
                        ROUND(e, f, g, h, a, b, c, d, schedule12, 0xD192E819)
                        ROUND(d, e, f, g, h, a, b, c, schedule13, 0xD6990624)
                        ROUND(c, d, e, f, g, h, a, b, schedule14, 0xF40E3585)
                        ROUND(b, c, d, e, f, g, h, a, schedule15, 0x106AA070)
                        ROUND(a, b, c, d, e, f, g, h, schedule16, 0x19A4C116)
                        ROUND(h, a, b, c, d, e, f, g, schedule17, 0x1E376C08)
                        ROUND(g, h, a, b, c, d, e, f, schedule18, 0x2748774C)
                        ROUND(f, g, h, a, b, c, d, e, schedule19, 0x34B0BCB5)
                        ROUND(e, f, g, h, a, b, c, d, schedule20, 0x391C0CB3)
                        ROUND(d, e, f, g, h, a, b, c, schedule21, 0x4ED8AA4A)
                        ROUND(c, d, e, f, g, h, a, b, schedule22, 0x5B9CCA4F)
                        ROUND(b, c, d, e, f, g, h, a, schedule23, 0x682E6FF3)
                        ROUND(a, b, c, d, e, f, g, h, schedule24, 0x748F82EE)
                        ROUND(h, a, b, c, d, e, f, g, schedule25, 0x78A5636F)
                        ROUND(g, h, a, b, c, d, e, f, schedule26, 0x84C87814)
                        ROUND(f, g, h, a, b, c, d, e, schedule27, 0x8CC70208)
                        ROUND(e, f, g, h, a, b, c, d, schedule28, 0x90BEFFFA)
                        ROUND(d, e, f, g, h, a, b, c, schedule29, 0xA4506CEB)
                        ROUND(c, d, e, f, g, h, a, b, schedule30, 0xBEF9A3F7)
                        ROUND(b, c, d, e, f, g, h, a, schedule31, 0xC67178F2)

                        hash0 = 0x6A09E667 + a;
                        hash1 = 0xBB67AE85 + b;
                        hash2 = 0x3C6EF372 + c;
                        hash3 = 0xA54FF53A + d;
                        hash4 = 0x510E527F + e;
                        hash5 = 0x9B05688C + f;
                        hash6 = 0x1F83D9AB + g;
                        hash7 = 0x5BE0CD19 + h;

                        a = hash0;
                        b = hash1;
                        c = hash2;
                        d = hash3;
                        e = hash4;
                        f = hash5;
                        g = hash6;
                        h = hash7;

                        ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h,  0, 0x428A2F98, 0)
                        ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g,  1, 0x71374491, 0)
                        ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f,  2, 0xB5C0FBCF, 0)
                        ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e,  3, 0xE9B5DBA5, 0)
                        ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d,  4, 0x3956C25B, indexW)
                        ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c,  5, 0x59F111F1, indexW)
                        ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b,  6, 0x923F82A4, indexW)
                        ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a,  7, 0xAB1C5ED5, indexW)
                        ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h,  8, 0xD807AA98, indexW)
                        ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g,  9, 0x12835B01, indexW)
                        ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 10, 0x243185BE, indexW)
                        ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 11, 0x550C7DC3, indexW)
                        ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 12, 0x72BE5D74, indexW)
                        ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 13, 0x80DEB1FE, indexW)
                        ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 14, 0x9BDC06A7, indexW)
                        ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 15, 0xC19BF174, indexW)
                        ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 16, 0xE49B69C1, indexW)
                        ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 17, 0xEFBE4786, indexW)
                        ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 18, 0x0FC19DC6, indexW)
                        ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 19, 0x240CA1CC, indexW)
                        ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 20, 0x2DE92C6F, indexW)
                        ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 21, 0x4A7484AA, indexW)
                        ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 22, 0x5CB0A9DC, indexW)
                        ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 23, 0x76F988DA, indexW)
                        ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 24, 0x983E5152, indexW)
                        ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 25, 0xA831C66D, indexW)
                        ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 26, 0xB00327C8, indexW)
                        ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 27, 0xBF597FC7, indexW)
                        ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 28, 0xC6E00BF3, indexW)
                        ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 29, 0xD5A79147, indexW)
                        ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 30, 0x06CA6351, indexW)
                        ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 31, 0x14292967, indexW)

                        ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 32, 0x27B70A85, indexW)
                        ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 33, 0x2E1B2138, indexW)
                        ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 34, 0x4D2C6DFC, indexW)
                        ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 35, 0x53380D13, indexW)
                        ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 36, 0x650A7354, indexW)
                        ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 37, 0x766A0ABB, indexW)
                        ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 38, 0x81C2C92E, indexW)
                        ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 39, 0x92722C85, indexW)
                        ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 40, 0xA2BFE8A1, indexW)
                        ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 41, 0xA81A664B, indexW)
                        ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 42, 0xC24B8B70, indexW)
                        ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 43, 0xC76C51A3, indexW)
                        ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 44, 0xD192E819, indexW)
                        ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 45, 0xD6990624, indexW)
                        ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 46, 0xF40E3585, indexW)
                        ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 47, 0x106AA070, indexW)
                        ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 48, 0x19A4C116, indexW)
                        ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 49, 0x1E376C08, indexW)
                        ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 50, 0x2748774C, indexW)
                        ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 51, 0x34B0BCB5, indexW)
                        ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 52, 0x391C0CB3, indexW)
                        ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 53, 0x4ED8AA4A, indexW)
                        ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 54, 0x5B9CCA4F, indexW)
                        ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 55, 0x682E6FF3, indexW)
                        ROUND_SECOND_BLOCK(a, b, c, d, e, f, g, h, 56, 0x748F82EE, indexW)
                        ROUND_SECOND_BLOCK(h, a, b, c, d, e, f, g, 57, 0x78A5636F, indexW)
                        ROUND_SECOND_BLOCK(g, h, a, b, c, d, e, f, 58, 0x84C87814, indexW)
                        ROUND_SECOND_BLOCK(f, g, h, a, b, c, d, e, 59, 0x8CC70208, indexW)
                        ROUND_SECOND_BLOCK(e, f, g, h, a, b, c, d, 60, 0x90BEFFFA, indexW)
                        ROUND_SECOND_BLOCK(d, e, f, g, h, a, b, c, 61, 0xA4506CEB, indexW)
                        ROUND_SECOND_BLOCK(c, d, e, f, g, h, a, b, 62, 0xBEF9A3F7, indexW)
                        ROUND_SECOND_BLOCK(b, c, d, e, f, g, h, a, 63, 0xC67178F2, indexW)
                        
                        hash0 += a;
                        hash1 += b;
                        hash2 += c;
                        hash3 += d;
                        hash4 += e;
                        hash5 += f;
                        hash6 += g;
                        hash7 += h;

                        indexW += SINGLE_BLOCK_W_SIZE;
                }

                schedule0 = IV0  ^ hash0;
                schedule1 = IV4  ^ hash1;
                schedule2 = IV8  ^ hash2;
                schedule3 = IV12 ^ hash3;
               
		schedule4 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule0 >> 24], TS1[(schedule1 >> 16) & 0xFF], TS2[(schedule2 >> 8) & 0xFF]) , TS3[schedule3 & 0xFF] , hash4);
		schedule5 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule1 >> 24], TS1[(schedule2 >> 16) & 0xFF], TS2[(schedule3 >> 8) & 0xFF]) , TS3[schedule0 & 0xFF] , hash5);
		schedule6 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule2 >> 24], TS1[(schedule3 >> 16) & 0xFF], TS2[(schedule0 >> 8) & 0xFF]) , TS3[schedule1 & 0xFF] , hash6);
		schedule7 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule3 >> 24], TS1[(schedule0 >> 16) & 0xFF], TS2[(schedule1 >> 8) & 0xFF]) , TS3[schedule2 & 0xFF] , hash7);

		hash0 ^= LOP3LUT_XOR(LOP3LUT_XOR( (TS2[(hash7 >> 24) ] & 0x000000FF), (TS3[(hash7 >> 16) & 0xFF] & 0xFF000000), (TS0[(hash7 >>  8) & 0xFF] & 0x00FF0000)), 
						  (TS1[(hash7 ) & 0xFF] & 0x0000FF00), 0x01000000
					); //RCON[0];
		hash1 ^= hash0; hash2 ^= hash1; hash3 ^= hash2;

		schedule0 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule4 >> 24], TS1[(schedule5 >> 16) & 0xFF], TS2[(schedule6 >> 8) & 0xFF]) , TS3[schedule7 & 0xFF] , hash0);
		schedule1 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule5 >> 24], TS1[(schedule6 >> 16) & 0xFF], TS2[(schedule7 >> 8) & 0xFF]) , TS3[schedule4 & 0xFF] , hash1);
		schedule2 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule6 >> 24], TS1[(schedule7 >> 16) & 0xFF], TS2[(schedule4 >> 8) & 0xFF]) , TS3[schedule5 & 0xFF] , hash2);
		schedule3 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule7 >> 24], TS1[(schedule4 >> 16) & 0xFF], TS2[(schedule5 >> 8) & 0xFF]) , TS3[schedule6 & 0xFF] , hash3);

		hash4 ^= (TS3[(hash3 >> 24)       ] & 0xFF000000) ^
				  (TS0[(hash3 >> 16) & 0xFF] & 0x00FF0000) ^
				  (TS1[(hash3 >>  8) & 0xFF] & 0x0000FF00) ^ 
				  (TS2[(hash3      ) & 0xFF] & 0x000000FF);
		hash5 ^= hash4;
		hash6 ^= hash5;
		hash7 ^= hash6;

		schedule4 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule0 >> 24], TS1[(schedule1 >> 16) & 0xFF], TS2[(schedule2 >> 8) & 0xFF]) , TS3[schedule3 & 0xFF] , hash4);
		schedule5 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule1 >> 24], TS1[(schedule2 >> 16) & 0xFF], TS2[(schedule3 >> 8) & 0xFF]) , TS3[schedule0 & 0xFF] , hash5);
		schedule6 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule2 >> 24], TS1[(schedule3 >> 16) & 0xFF], TS2[(schedule0 >> 8) & 0xFF]) , TS3[schedule1 & 0xFF] , hash6);
		schedule7 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule3 >> 24], TS1[(schedule0 >> 16) & 0xFF], TS2[(schedule1 >> 8) & 0xFF]) , TS3[schedule2 & 0xFF] , hash7);
		
		hash0 ^= (TS2[(hash7 >> 24)       ] & 0x000000FF) ^
				  (TS3[(hash7 >> 16) & 0xFF] & 0xFF000000) ^
				  (TS0[(hash7 >>  8) & 0xFF] & 0x00FF0000) ^
				  (TS1[(hash7      ) & 0xFF] & 0x0000FF00) ^ 0x02000000; //RCON[1];
		hash1 ^= hash0; hash2 ^= hash1; hash3 ^= hash2;

		schedule0 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule4 >> 24], TS1[(schedule5 >> 16) & 0xFF], TS2[(schedule6 >> 8) & 0xFF]) , TS3[schedule7 & 0xFF] , hash0);
		schedule1 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule5 >> 24], TS1[(schedule6 >> 16) & 0xFF], TS2[(schedule7 >> 8) & 0xFF]) , TS3[schedule4 & 0xFF] , hash1);
		schedule2 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule6 >> 24], TS1[(schedule7 >> 16) & 0xFF], TS2[(schedule4 >> 8) & 0xFF]) , TS3[schedule5 & 0xFF] , hash2);
		schedule3 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule7 >> 24], TS1[(schedule4 >> 16) & 0xFF], TS2[(schedule5 >> 8) & 0xFF]) , TS3[schedule6 & 0xFF] , hash3);

		hash4 ^= (TS3[(hash3 >> 24)       ] & 0xFF000000) ^
				  (TS0[(hash3 >> 16) & 0xFF] & 0x00FF0000) ^
				  (TS1[(hash3 >>  8) & 0xFF] & 0x0000FF00) ^ 
				  (TS2[(hash3      ) & 0xFF] & 0x000000FF);
		hash5 ^= hash4;
		hash6 ^= hash5;
		hash7 ^= hash6;

		schedule4 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule0 >> 24], TS1[(schedule1 >> 16) & 0xFF], TS2[(schedule2 >> 8) & 0xFF]) , TS3[schedule3 & 0xFF] , hash4);
		schedule5 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule1 >> 24], TS1[(schedule2 >> 16) & 0xFF], TS2[(schedule3 >> 8) & 0xFF]) , TS3[schedule0 & 0xFF] , hash5);
		schedule6 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule2 >> 24], TS1[(schedule3 >> 16) & 0xFF], TS2[(schedule0 >> 8) & 0xFF]) , TS3[schedule1 & 0xFF] , hash6);
		schedule7 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule3 >> 24], TS1[(schedule0 >> 16) & 0xFF], TS2[(schedule1 >> 8) & 0xFF]) , TS3[schedule2 & 0xFF] , hash7);

		hash0 ^= (TS2[(hash7 >> 24)       ] & 0x000000FF) ^
				  (TS3[(hash7 >> 16) & 0xFF] & 0xFF000000) ^
				  (TS0[(hash7 >>  8) & 0xFF] & 0x00FF0000) ^
				  (TS1[(hash7      ) & 0xFF] & 0x0000FF00) ^ 0x04000000; //RCON[2];
		hash1 ^= hash0; hash2 ^= hash1; hash3 ^= hash2;

		schedule0 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule4 >> 24], TS1[(schedule5 >> 16) & 0xFF], TS2[(schedule6 >> 8) & 0xFF]) , TS3[schedule7 & 0xFF] , hash0);
		schedule1 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule5 >> 24], TS1[(schedule6 >> 16) & 0xFF], TS2[(schedule7 >> 8) & 0xFF]) , TS3[schedule4 & 0xFF] , hash1);
		schedule2 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule6 >> 24], TS1[(schedule7 >> 16) & 0xFF], TS2[(schedule4 >> 8) & 0xFF]) , TS3[schedule5 & 0xFF] , hash2);
		schedule3 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule7 >> 24], TS1[(schedule4 >> 16) & 0xFF], TS2[(schedule5 >> 8) & 0xFF]) , TS3[schedule6 & 0xFF] , hash3);


		hash4 ^= (TS3[(hash3 >> 24)       ] & 0xFF000000) ^
				  (TS0[(hash3 >> 16) & 0xFF] & 0x00FF0000) ^
				  (TS1[(hash3 >>  8) & 0xFF] & 0x0000FF00) ^ 
				  (TS2[(hash3      ) & 0xFF] & 0x000000FF);
		hash5 ^= hash4;
		hash6 ^= hash5;
		hash7 ^= hash6;

		schedule4 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule0 >> 24], TS1[(schedule1 >> 16) & 0xFF], TS2[(schedule2 >> 8) & 0xFF]) , TS3[schedule3 & 0xFF] , hash4);
		schedule5 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule1 >> 24], TS1[(schedule2 >> 16) & 0xFF], TS2[(schedule3 >> 8) & 0xFF]) , TS3[schedule0 & 0xFF] , hash5);
		schedule6 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule2 >> 24], TS1[(schedule3 >> 16) & 0xFF], TS2[(schedule0 >> 8) & 0xFF]) , TS3[schedule1 & 0xFF] , hash6);
		schedule7 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule3 >> 24], TS1[(schedule0 >> 16) & 0xFF], TS2[(schedule1 >> 8) & 0xFF]) , TS3[schedule2 & 0xFF] , hash7);
		
		hash0 ^= (TS2[(hash7 >> 24)       ] & 0x000000FF) ^
				  (TS3[(hash7 >> 16) & 0xFF] & 0xFF000000) ^
				  (TS0[(hash7 >>  8) & 0xFF] & 0x00FF0000) ^
				  (TS1[(hash7      ) & 0xFF] & 0x0000FF00) ^ 0x08000000; //RCON[3];
		hash1 ^= hash0; hash2 ^= hash1; hash3 ^= hash2;

		schedule0 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule4 >> 24], TS1[(schedule5 >> 16) & 0xFF], TS2[(schedule6 >> 8) & 0xFF]) , TS3[schedule7 & 0xFF] , hash0);
		schedule1 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule5 >> 24], TS1[(schedule6 >> 16) & 0xFF], TS2[(schedule7 >> 8) & 0xFF]) , TS3[schedule4 & 0xFF] , hash1);
		schedule2 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule6 >> 24], TS1[(schedule7 >> 16) & 0xFF], TS2[(schedule4 >> 8) & 0xFF]) , TS3[schedule5 & 0xFF] , hash2);
		schedule3 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule7 >> 24], TS1[(schedule4 >> 16) & 0xFF], TS2[(schedule5 >> 8) & 0xFF]) , TS3[schedule6 & 0xFF] , hash3);
		
		hash4 ^= (TS3[(hash3 >> 24)       ] & 0xFF000000) ^
				  (TS0[(hash3 >> 16) & 0xFF] & 0x00FF0000) ^
				  (TS1[(hash3 >>  8) & 0xFF] & 0x0000FF00) ^ 
				  (TS2[(hash3      ) & 0xFF] & 0x000000FF);
		hash5 ^= hash4;
		hash6 ^= hash5;
		hash7 ^= hash6;

		schedule4 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule0 >> 24], TS1[(schedule1 >> 16) & 0xFF], TS2[(schedule2 >> 8) & 0xFF]) , TS3[schedule3 & 0xFF] , hash4);
		schedule5 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule1 >> 24], TS1[(schedule2 >> 16) & 0xFF], TS2[(schedule3 >> 8) & 0xFF]) , TS3[schedule0 & 0xFF] , hash5);
		schedule6 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule2 >> 24], TS1[(schedule3 >> 16) & 0xFF], TS2[(schedule0 >> 8) & 0xFF]) , TS3[schedule1 & 0xFF] , hash6);
		schedule7 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule3 >> 24], TS1[(schedule0 >> 16) & 0xFF], TS2[(schedule1 >> 8) & 0xFF]) , TS3[schedule2 & 0xFF] , hash7);

		hash0 ^= (TS2[(hash7 >> 24)       ] & 0x000000FF) ^
				  (TS3[(hash7 >> 16) & 0xFF] & 0xFF000000) ^
				  (TS0[(hash7 >>  8) & 0xFF] & 0x00FF0000) ^
				  (TS1[(hash7      ) & 0xFF] & 0x0000FF00) ^ 0x10000000; //RCON[4];
		hash1 ^= hash0; hash2 ^= hash1; hash3 ^= hash2;

		schedule0 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule4 >> 24], TS1[(schedule5 >> 16) & 0xFF], TS2[(schedule6 >> 8) & 0xFF]) , TS3[schedule7 & 0xFF] , hash0);
		schedule1 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule5 >> 24], TS1[(schedule6 >> 16) & 0xFF], TS2[(schedule7 >> 8) & 0xFF]) , TS3[schedule4 & 0xFF] , hash1);
		schedule2 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule6 >> 24], TS1[(schedule7 >> 16) & 0xFF], TS2[(schedule4 >> 8) & 0xFF]) , TS3[schedule5 & 0xFF] , hash2);
		schedule3 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule7 >> 24], TS1[(schedule4 >> 16) & 0xFF], TS2[(schedule5 >> 8) & 0xFF]) , TS3[schedule6 & 0xFF] , hash3);

		hash4 ^= (TS3[(hash3 >> 24)       ] & 0xFF000000) ^
				  (TS0[(hash3 >> 16) & 0xFF] & 0x00FF0000) ^
				  (TS1[(hash3 >>  8) & 0xFF] & 0x0000FF00) ^ 
				  (TS2[(hash3      ) & 0xFF] & 0x000000FF);
		hash5 ^= hash4;
		hash6 ^= hash5;
		hash7 ^= hash6;

		schedule4 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule0 >> 24], TS1[(schedule1 >> 16) & 0xFF], TS2[(schedule2 >> 8) & 0xFF]) , TS3[schedule3 & 0xFF] , hash4);
		schedule5 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule1 >> 24], TS1[(schedule2 >> 16) & 0xFF], TS2[(schedule3 >> 8) & 0xFF]) , TS3[schedule0 & 0xFF] , hash5);
		schedule6 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule2 >> 24], TS1[(schedule3 >> 16) & 0xFF], TS2[(schedule0 >> 8) & 0xFF]) , TS3[schedule1 & 0xFF] , hash6);
		schedule7 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule3 >> 24], TS1[(schedule0 >> 16) & 0xFF], TS2[(schedule1 >> 8) & 0xFF]) , TS3[schedule2 & 0xFF] , hash7);

		hash0 ^= (TS2[(hash7 >> 24)       ] & 0x000000FF) ^
				  (TS3[(hash7 >> 16) & 0xFF] & 0xFF000000) ^
				  (TS0[(hash7 >>  8) & 0xFF] & 0x00FF0000) ^
				  (TS1[(hash7      ) & 0xFF] & 0x0000FF00) ^ 0x20000000; //RCON[5];
		hash1 ^= hash0; hash2 ^= hash1; hash3 ^= hash2;

		schedule0 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule4 >> 24], TS1[(schedule5 >> 16) & 0xFF], TS2[(schedule6 >> 8) & 0xFF]) , TS3[schedule7 & 0xFF] , hash0);
		schedule1 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule5 >> 24], TS1[(schedule6 >> 16) & 0xFF], TS2[(schedule7 >> 8) & 0xFF]) , TS3[schedule4 & 0xFF] , hash1);
		schedule2 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule6 >> 24], TS1[(schedule7 >> 16) & 0xFF], TS2[(schedule4 >> 8) & 0xFF]) , TS3[schedule5 & 0xFF] , hash2);
		schedule3 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule7 >> 24], TS1[(schedule4 >> 16) & 0xFF], TS2[(schedule5 >> 8) & 0xFF]) , TS3[schedule6 & 0xFF] , hash3);

		hash4 ^= (TS3[(hash3 >> 24)       ] & 0xFF000000) ^
				  (TS0[(hash3 >> 16) & 0xFF] & 0x00FF0000) ^
				  (TS1[(hash3 >>  8) & 0xFF] & 0x0000FF00) ^ 
				  (TS2[(hash3      ) & 0xFF] & 0x000000FF);
		hash5 ^= hash4;
		hash6 ^= hash5;
		hash7 ^= hash6;

		schedule4 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule0 >> 24], TS1[(schedule1 >> 16) & 0xFF], TS2[(schedule2 >> 8) & 0xFF]) , TS3[schedule3 & 0xFF] , hash4);
		schedule5 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule1 >> 24], TS1[(schedule2 >> 16) & 0xFF], TS2[(schedule3 >> 8) & 0xFF]) , TS3[schedule0 & 0xFF] , hash5);
		schedule6 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule2 >> 24], TS1[(schedule3 >> 16) & 0xFF], TS2[(schedule0 >> 8) & 0xFF]) , TS3[schedule1 & 0xFF] , hash6);
		schedule7 = LOP3LUT_XOR(LOP3LUT_XOR(TS0[schedule3 >> 24], TS1[(schedule0 >> 16) & 0xFF], TS2[(schedule1 >> 8) & 0xFF]) , TS3[schedule2 & 0xFF] , hash7);

		hash0 ^= (TS2[(hash7 >> 24)       ] & 0x000000FF) ^
			  (TS3[(hash7 >> 16) & 0xFF] & 0xFF000000) ^
			  (TS0[(hash7 >>  8) & 0xFF] & 0x00FF0000) ^
			  (TS1[(hash7      ) & 0xFF] & 0x0000FF00) ^ 0x40000000; //RCON[6];
		hash1 ^= hash0;
		hash2 ^= hash1;
		hash3 ^= hash2;

		schedule0 = (TS2[(schedule4 >> 24)       ] & 0xFF000000) ^
			 (TS3[(schedule5 >> 16) & 0xFF] & 0x00FF0000) ^
			 (TS0[(schedule6 >>  8) & 0xFF] & 0x0000FF00) ^
			 (TS1[(schedule7      ) & 0xFF] & 0x000000FF) ^ hash0;

		schedule1 = (TS2[(schedule5 >> 24)       ] & 0xFF000000) ^
			 (TS3[(schedule6 >> 16) & 0xFF] & 0x00FF0000) ^
			 (TS0[(schedule7 >>  8) & 0xFF] & 0x0000FF00) ^
			 (TS1[(schedule4      ) & 0xFF] & 0x000000FF) ^ hash1;

		schedule2 = (TS2[(schedule6 >> 24)       ] & 0xFF000000) ^
			 (TS3[(schedule7 >> 16) & 0xFF] & 0x00FF0000) ^
			 (TS0[(schedule4 >>  8) & 0xFF] & 0x0000FF00) ^
			 (TS1[(schedule5      ) & 0xFF] & 0x000000FF) ^ hash2;

		schedule3 = (TS2[(schedule7 >> 24)       ] & 0xFF000000) ^
			 (TS3[(schedule4 >> 16) & 0xFF] & 0x00FF0000) ^
			 (TS0[(schedule5 >>  8) & 0xFF] & 0x0000FF00) ^
			 (TS1[(schedule6      ) & 0xFF] & 0x000000FF) ^ hash3;

                schedule4 =
                    (unsigned int)(((unsigned int)(schedule0 & 0xff000000)) >> 24) |
                    (unsigned int)((unsigned int)(schedule0 & 0x00ff0000) >> 8) |
                    (unsigned int)((unsigned int)(schedule0 & 0x0000ff00) << 8) |
                    (unsigned int)((unsigned int)(schedule0 & 0x000000ff) << 24);

                schedule5 =
                    (unsigned int)(((unsigned int)(schedule1 & 0xff000000)) >> 24) |
                    (unsigned int)((unsigned int)(schedule1 & 0x00ff0000) >> 8) |
                    (unsigned int)((unsigned int)(schedule1 & 0x0000ff00) << 8) |
                    (unsigned int)((unsigned int)(schedule1 & 0x000000ff) << 24);

                schedule6 =
                    (unsigned int)(((unsigned int)(schedule2 & 0xff000000)) >> 24) |
                    (unsigned int)((unsigned int)(schedule2 & 0x00ff0000) >> 8) |
                    (unsigned int)((unsigned int)(schedule2 & 0x0000ff00) << 8) |
                    (unsigned int)((unsigned int)(schedule2 & 0x000000ff) << 24);

                if (
                        ((vmkKey[0] ^ ((unsigned char)schedule4)) == 0x2c) &&
                        ((vmkKey[1] ^ ((unsigned char)(schedule4 >> 8))) == 0x00) &&
                        ((vmkKey[4] ^ ((unsigned char) schedule5)) == 0x01) &&
                        ((vmkKey[5] ^ ((unsigned char) (schedule5 >> 8))) == 0x00) &&
#if STRICT_CHECK == 1
                        ((vmkKey[8] ^ ((unsigned char) schedule6)) == 0x03) &&
#else                        
                        ((vmkKey[8] ^ ((unsigned char)schedule6)) <= 0x05) &&
#endif
                        ((vmkKey[9] ^ ((unsigned char)(schedule6 >> 8))) == 0x20)
                )
                {
                        found[0] = gIndex;
                        break;
		}

		gIndex += get_global_size(0);
	}

	return;
}
