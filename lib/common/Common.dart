import '../config_app.dart';

class Common {
  static final int MODE_NIGHT_AUTO = 0;
  static final int MODE_NIGHT_NO = 1;
  static final int MODE_NIGHT_YES = 2;
  static final String CHANNEL = "com.example.darkmode";
  static final String INTER_ADS = config_app["INTER_ADS"];
  static final String ADS_ID = config_app["ADS_ID"];
  static final String BANNER_ADS = config_app["BANNER_ADS"];
  static final String APP_LINK = config_app["APP_LINK"];
  static final String MAIL_FEEDBACK = config_app["MAIL_FEEDBACK"];

  static var selectedTheme = {"code": 1, "name": "Light"};
  static var tagetInforKeyWord = config_app["tagetInforKeyWord"];
  static var contentUrl = config_app["contentUrl"];
  static dynamic supportApp = [
    {
      "name": "Google Fit",
      "image":
          "https://lh3.googleusercontent.com/jArSD-kxOa2llPXvqrjRcEJdL4XhjP8-WqEfg9UAlYF8v0qzXAZ0EI5k96l0pf3tDNg=s180-rw"
    },
    {
      "name": "Google Pay",
      "image":
          "https://lh3.googleusercontent.com/G5e8P4Y9_Wo2vmkCAvl9sWXUPBGoz3A4ojjokAneaAGVQvMarh_Yuk_5dpGL03KgWLc=s180-rw"
    },
    {
      "name": "",
      "image":
          "https://lh3.googleusercontent.com/JRiXMoJZE5lKvNmI6beVk73CYXouvFA1jceM5-16fLvEisZy4qsEbk8LZl4I7ONLyw=s180-rw"
    },
    {
      "name": "Instagram",
      "image":
          "https://lh3.googleusercontent.com/2sREY-8UpjmaLDCTztldQf6u2RGUtuyf6VT5iyX3z53JS4TdvfQlX-rNChXKgpBYMw=s180-rw"
    },
    {
      "name": "Google Chrome",
      "image":
          "https://lh3.googleusercontent.com/KwUBNPbMTk9jDXYS2AeX3illtVRTkrKVh5xR1Mg4WHd0CG2tV4mrh1z3kXi5z_warlk=s180-rw"
    },
    {
      "name": "Pocket Casts",
      "image":
          "https://lh3.googleusercontent.com/23K9TDTOdlo57Pi9JvNtPc9K-utruK6jQEpQGD_E4QBLRJYRAgLcC7gF2Rd_0T1qhLLS=s180-rw"
    },
    {
      "name": "Microsoft Launcher",
      "image":
          "https://lh3.googleusercontent.com/cvpf05vtdwfnYdUNsVsrwvBFZyJk6ffbaTu6yFAD1Lq34mdNk-oejH1Qo9gayqjbrKl6=s180-rw"
    },
    {
      "name": "Gboard",
      "image":
          "https://lh3.googleusercontent.com/X64En0aW6jkvDnd5kr16u-YuUsoJ1W2cBzJab3CQ5lObLeQ3T61DpB7AwIoZ7uqgCn4=s180-rw"
    },
    {
      "name": "KWGT Kustom Widget Maker",
      "image":
          "https://lh3.googleusercontent.com/4I0r92jtWwSNfz6S9eZIS-D3Q4o2ODBw3NCvx50ctS11Tv4iY5UmhjqMJ2hePgjHYWY=s180-rw"
    },
    {
      "name": "Retro Music Player",
      "image":
          "https://lh3.googleusercontent.com/0WvFktMVrEEO__ZeijejI3quaD8oC8yu2sUxHIGf_qgUoy-EQvO-kX0MZH7RLSxCqjs=s180-rw"
    },
    {
      "name": "KLWP Live Wallpaper Maker",
      "image":
          "https://lh3.googleusercontent.com/x7QkuN3WJnW97riy4xciMdHAkEbqQ0FinXGAum28oz7bfZorCu2ZIn5zrPapYREYctU=s180-rw"
    },
    {
      "name": "Transit",
      "image":
          "https://lh3.googleusercontent.com/rDVnZ9rwreErP5_wwGrSVtx-prgRBTCJwdCP9iQFkt_3EerJzB0rxA15EIAGYXUNZA=s180-rw"
    },
    {
      "name": "Deezer Music Player",
      "image":
          "https://lh3.googleusercontent.com/KGlr2wcEj87My4PmLhx_reV03aOspugauRIsNk5W7Th1lClONorCUkAC5_anSvKVpqs=s180-rw"
    },
  ];
  static final dynamic htmlDetail = [
    {
      "title":
          """<h3 property="name">Updating from MIUI 10 to 11 breaks dark mode. What went wrong?</h3>""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>The Android dark mode functionality was disabled in MIUI 11 and can't be re-activated by third-party apps like Dark Mode.</p>
					<p>There is a thread in the MIUI Community Forum that reports this behavior as a bug in MIUI 11. If you are affected by this issue, feel free to share your experience there: <a href="https://c.mi.com/thread-2626609-1-0.html">https://c.mi.com/thread-2626609-1-0.html</a></p>
					<p>The more visibility this issue receives, the more likely it will be fixed soon.</p>
					<p><span style="color: #ff5e6e;">Update:</span> Several solutions for this issue were found by the community.</p>
					<p><b>First Option:</b></p>
					<ol>
						<li>Open the security app</li>
						<li>Start a scan</li>
						<li>Continue with an optimization</li>
						<li>In the end, you will be notified that some elements are not displayed correctly</li>
						<li>Press "Fix it" to restore the day mode</li>
					</ol>
					<p><b>Second Option:</b></p>
					<p>Unfortunately, the last option is to do a factory reset of the phone. Warning: This deletes all data from your phone!</p>
				</div>
			</div>"""
    },
    {
      "title":
          """<h2 property="name">My Samsung Galaxy keeps switching back to day mode. What can I do?</h2>""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>Since Nov. 21, 2019 some Samsung Galaxy devices repeatedly switch back to day mode. This not an issue with the Dark Mode app but with the Email app by Samsung.</p>
					<p>The Samsung Email app overwrites the Android night mode settings which may switch your device back to day mode. This happens whenever the app is opened and sometimes even when the app is running in the background.</p>
					<p><b>Solution 1</b> - Disable the Samsung Email app</p>
					<ol>
						<li>Open your Android Settings</li>
						<li>Click "Apps"</li>
						<li>Select the Email app</li>
						<li>Click on the settings ⋮ in the top right corner</li>
						<li>Click on "Uninstall updates"</li>
						<li>Click "OK" in the dialog</li>
					</ol>
					<p><b>Solution 2</b> - Disable the dark mode settings of the Samsung Email app</p>
					<ol>
						<li>Open the Samsung Email app</li>
						<li>Open the menu ☰ in the top left corner</li>
						<li>Click on the settings <img style="height: .8em;" src="gear.svg" alt="gear"> in the top right corner</li>
						<li>Enable "Night mode"</li>
						<li style="list-style-type: none; margin-top: .5em;">Now the Email app will still overwrite the Android dark mode settings but, instead of activating the day mode, it will activate the night mode.</li>
					</ol>
					<p>Note: Keep in mind that there may be other apps on your phone which have similar issues.</p>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">This app does not work on my phone. What went wrong?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>Most likely, your phone manufacturer has disabled the Android dark mode on your phone. A number of phones are affected by this issue, for example, a few specific Samsung Galaxy and Xiaomi Redmi phones.</p>
					<p>Unfortunately, there is nothing I can do to fix this. I'm sorry about that. 😔</p>
					<p>If you are lucky, your phone manufacturer will enable the dark mode with a future update.</p>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">Why is app XYZ not supported?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>The Dark Mode app supports all apps that have a dark theme. If an app is not turning dark, this means that the app does not have a dark theme.</p>
					<p>Unfortunately, there is no way for me to implement a dark theme for that app - only its owner can do so. If you really need the dark mode for that app, I'd recommend contacting its owner. Chances are they are already working on a dark theme for their app. 😊</p>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">Which apps are supported?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>The Dark Mode app supports all apps that have a dark theme.</p>
					<p>Popular examples include <i>Google Chrome</i>, <i>Google Play</i> and <i>Instagram</i>. <i>WhatsApp</i> is currently working on a dark theme that will hopefully be released soon.</p>
					<p>For a full list of popular apps that are known to have a dark theme, <a href="dark_apps">click here</a>.</p>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">The dark mode is active but Instagram stays light. Why is that?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>Instagram got a dark theme in October 2019.</p>
					<p>If your Instagram is still light, chances are your phone is too old to receive the latest Instagram updates.</p>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">I uninstalled the app, but my phone stays dark. How can I get the light mode back?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<ol>
						<li>Install the app again.</li>
						<li>Select light mode.</li>
						<li>Uninstall the app again.</li>
					</ol>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">The dark mode is turned off after some time. Why is that?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>There are multiple possibilities:</p>
					<ul>
						<li>You have selected "Auto" rather than "Night Mode". "Auto" may look dark at first, but it actually toggles the mode automatically depending on the current time: dark at night, light by day.</li>
						<li>The mode was turned off by another app that is overwriting the Android dark mode settings.</li>
						<li>The mode was turned off by whoever used your phone while you weren't looking. 🙈</li>
					</ul>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">What is the Auto mode and how does it work?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>The Auto mode enables the night mode in the evening and the day mode in the morning.</p>
					<p>Unfortunately, some phone manufacturers changed or removed this behavior in their customized android versions.</p>
					<p> In case the auto mode does not work on your device, your phone manufacturer has probably disabled this mode.</p>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">App XYZ looks weird since activating the dark mode. What went wrong?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>The Dark Mode app allows you to switch between the dark and light theme of your apps. These themes are provided by the apps themselves.</p>
					<p>If an app "looks weird" after switching to dark mode, then that's because</p>
					<ul>
						<li>that's how the app was intended to look by its developers, or</li>
						<li>the developers of the app made a mistake when adding the dark theme to their app.</li>
					</ul>
					<p>If you think the developers made a mistake, I'd recommend contacting them. Perhaps they are already working on fixing the issue. 😊</p>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">My screen has an orange tint since activating the dark mode. Why is that?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>This is due to a (mis-)configuration by your phone manufacturer. Usually, switching to dark mode only affects your apps, but not your screen. Some manufacturers however couple switching to dark mode with dimming and tinting your screen. Presumably, this is done to reduce eye strain from blue light in the evening.</p>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">Which Android versions are supported?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>Starting with Android 4.1 (Jelly Bean), released in 2013, all recent Android versions are supported.</p>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">No one likes ads. Why do you show them, and how can I remove them?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>I don't like ads either, but unfortunately, I cannot afford working on this app for several hours a day – without earning any money.</p>
					<p>If you want to remove the ads, you can buy Premium (formerly known as the Supporter Pack) in the app.</p>
					<p>Any support is much appreciated! ❤️</p>
				</div>
			</div>"""
    },
    {
      "title": """
				<h2 property="name">I updated Android, but I cannot change the mode anymore. Why is that?</h2>
			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>Your phone manufacturer has disabled the Android dark mode functionality in the new update.</p>
					<p>Unfortunately, there is nothing the app can do to enable the dark mode again once it has been disabled.</p>
					<p>I am really sorry for the inconvenience. Wish I could help. 😔</p>
				</div>
			</div>"""
    },
    {
      "title":
          """				<h2 property="name">What's the roadmap of this app?</h2>			""",
      "content": """<div property="acceptedAnswer" typeof="Answer">
				<div property="text">
					<p>There's plenty of things to do!</p>
					<p>Apart from improving the user experience and the design of the app, there's a number of features that I plan to work on in the coming weeks and months, for example:</p>
					<ul>
						<li>Quick Settings for the notification view</li>
						<li>Notification for toggling the mode</li>
						<li>New advanced mode: Turn on/off dark mode based on a custom schedule</li>
					</ul>
				</div>
			</div>"""
    },
  ];
}
