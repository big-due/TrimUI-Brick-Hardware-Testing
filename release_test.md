# NextUI Test Release Eval

Tested on request from frysee via discord

Testing: 20250508-0-base

in menu static item: 262mA
scrolling item: 279mA


| Emulator | Nominal (mA) | Peak (mA) | New Nominal (mA) | New Peak (mA) | Nominal Diff (%) | Peak Diff (%) |
|----------|--------------|-----------|------------------|---------------|------------------|---------------|
| GB       | 313          | 339       | 320              | 320           | +2.2%            | -5.6%         |
| GBA      | 325          | 350       | 328              | 328           | +0.9%            | -6.3%         |
| MGBA     | 337          | 363       | 360              | 400           | +6.8%            | +10.2%        |
| GBC      | 320          | 349       | 328              | 328           | +2.5%            | -6.0%         |
| FC       | 347          | 376       | 360              | 418           | +3.7%            | +11.2%        |
| SFC      | 355          | 385       | 365              | 413           | +2.8%            | +7.3%         |
| SUPA     | 385          | 400       | 385              | 413           | 0.0%             | +3.3%         |

<img src="images/newrelease/newrelease_gb.png" />

*GB - Nominal: 320mA, Peak: 320mA*

<img src="images/newrelease/newrelease_gba.png" />

*GBA - Nominal: 328mA, Peak: 328mA*

<img src="images/newrelease/newrelease_mgba.png" />

*MGBA - Nominal: 360mA, Peak: 400mA*

<img src="images/newrelease/newrelease_gbc.png" />

*GBC - Nominal: 328mA, Peak: 328mA*

<img src="images/newrelease/newrelease_fc.png" />

*FC - Nominal: 360mA, Peak: 418mA*

Weird behavior for SFC. Launching it initially it was unusably slow.  After going to SUPA then back it behaved "normally" from what I could see.  The numbers in the table are from when it was workign "normally" in the second attempt.

<img src="images/newrelease/newrelease_sfc1.png" />

*SFC - odd behavior, less than 10fps*

<img src="images/newrelease/newrelease_supa.png" />

*SUPA - Nominal: 385mA, Peak: 413mA*

<img src="images/newrelease/newrelease_sfc2.png" />

*FC - Nominal: 365mA, Peak: 413mA*


RMS values extracted from scope captures:

| Emulator | 4.3.15 current mA | newrelease current mA | Difference (%) |
|----------|-------------------|----------------------|----------------|
| GB       | 376               | 408                  | +8.5%          |
| GBA      | 382               | 412                  | +7.9%          |
| MGBA     | 411               | 487                  | +18.5%         |
| GBC      | 385               | 413                  | +7.3%          |
| FC       | 411               | 476                  | +15.8%         |
| SFC      | 406               | 454                  | +11.8%         |
| SUPA     | 465               | 501                  | +7.7%          |

