//
//  TsAndCsView.swift
//  Shelify
//
//  Created by Hannah Dadd on 01/05/2026.
//

import SwiftUI

struct TsAndCsView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("TERMS OF SERVICE")
                    .font(Font.custom("AbrilFatface-Regular", size: 34, relativeTo: .title))
                Text("""
 Last updated: May 20, 2026
 Welcome to Shelfify. By downloading or using the app, you agree to these Terms of Service.
 You agree to use the app only in compliance with applicable laws and regulations.
 
** Offline Functionality **

 The app is designed to function completely offline. Features such as writing sprint timers, progress tracking, notifications, Live Activities, visual backgrounds, and motivational animations operate locally on your device.

 ** User Data **

 The app does not collect, transmit, or store personal data on external servers.
 Any information stored by the app, including writing progress or word counts, is stored locally on your device only.
 You are responsible for maintaining your own device backups if desired.
 
 ** Intellectual Property **

 All app content, design, graphics, animations, sprites, text, and software are the property of the app's owner.
 You may not:
 Copy or redistribute the app
 Reverse engineer the app except where permitted by law
 Use the app for unlawful purposes
 Remove copyright or ownership notices
 
 ** Availability **

 We aim to keep the app functioning reliably, but we do not guarantee uninterrupted availability or that the app will always be error-free.
 Features may change, be updated, or be removed at any time without notice.

 ** Disclaimer **

 The app is provided “as is” and “as available” without warranties of any kind, express or implied.
 We do not guarantee that:
 The app will meet all user expectations
 The app will always operate without bugs or interruptions
 Progress or locally stored data will never be lost
 
 ** Limitation of Liability **

 To the maximum extent permitted by law, the developer of the app shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from the use of the app.
 This includes loss of data, device issues, productivity loss, or other intangible losses.

 ** Termination **

 You may stop using the app at any time by uninstalling it from your device.
 We reserve the right to update or discontinue the app at any time.
 
 ** Changes to These Terms **

 We may update these Terms of Service from time to time. Continued use of the app after changes are made constitutes acceptance of the updated terms.

 **Contact**
 If you have questions about these Terms of Service, please contact:
 getitwrite@gmail.com
""")
                .font(Font.custom("Bellefair-Regular", size: 18, relativeTo: .body))
            }
            .padding()
        }
    }
}

