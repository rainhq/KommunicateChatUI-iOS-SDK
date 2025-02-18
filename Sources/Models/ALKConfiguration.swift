//
//  ALKUIConfiguration.swift
//  KommunicateChatUI-iOS-SDK
//
//  Created by Mukesh Thawani on 13/06/18.
//

import Foundation
import UIKit
#if canImport(RichMessageKit)
    import RichMessageKit
#endif

public struct ALKConfiguration {
    /// If enabled then tapping on navigation bar in
    /// conversation view will open the group detail screen.
    /// - NOTE: Only works in case of groups.
    public var isTapOnNavigationBarEnabled = true

    /// If enabled then tapping on the user's profile
    /// icon in group chat will open a thread with that user.
    /// - NOTE: You will see the previous messages(if there are any).
    public var isProfileTapActionEnabled = true

    /// The background color of the ALKConversationViewController.
    public var backgroundColor = UIColor(netHex: 0xF9F9F9)

    /// Hides the bottom line in the navigation bar.
    /// It will be hidden in all the ViewControllers where
    /// navigation bar is visible. Default value is true.
    public var hideNavigationBarBottomLine = true

    /// ChatBar's bottom view color. This is the view which contains
    /// all the attachment and other options.
    public var chatBarAttachmentViewBackgroundColor = UIColor.background(.grayEF)

    /// If true then audio option in chat bar will be hidden.
    public var hideAudioOptionInChatBar = false

    /// If true then the start new chat button will be hidden.
    public var hideStartChatButton = false

    /// Pass the name of Localizable Strings file
    public var localizedStringFileName = "Localizable"
    
    /// Send message icon in chat bar.
    public var sendMessageIcon = UIImage(named: "send", in: Bundle.km, compatibleWith: nil)
    
    /// Rating conversation icon in app bar.
    public var ratingMenuIcon = UIImage(named: "ic_menu", in: Bundle.km, compatibleWith: nil)

    /// Image for navigation bar right side icon in conversation view.
    @available(*, deprecated, message: "Use navigationItemsForConversationView instead")
    public var rightNavBarImageForConversationView: UIImage?

    /// System icon for right side navigation bar in conversation view.
    public var rightNavBarSystemIconForConversationView = UIBarButtonItem.SystemItem.refresh

    /// If true then right side navigation icon in conversation view will be hidden.
    public var hideRightNavBarButtonForConversationView = false

    /// If true then back  navigation icon in conversation list will be hidden.
    public var hideBackButtonInConversationList = false

    /// If true then line between send button and text view will be hidden.
    public var hideLineImageFromChatBar = false

    /// If true then typing status will show user names.
    public var showNameWhenUserTypesInGroup = true

    /// If true then start new conversation button shown in the empty state will be disabled
    public var hideEmptyStateStartNewButtonInConversationList = false

    /// Additional information you can pass in message metadata in all the messages.
    public var messageMetadata: [AnyHashable: Any]?

    /// Status bar style. It will be used in all view controllers.
    /// Default value is lightContent.
    public var statusBarStyle: UIStatusBarStyle = .lightContent {
        didSet {
            ALKBaseNavigationViewController.statusBarStyle = statusBarStyle
        }
    }

    /// If true then the all the buttons in messages of type Quick replies,
    /// Generic Cards, Lists etc. will be disabled.
    /// USAGE: It can be used in cases where your app supports multiple types
    /// of users and you want to disable the buttons for a particular type of users.
    public var disableRichMessageButtonAction = false

    /// The name of the restricted words file. Only pass the
    /// name of the file and file extension is not required.
    /// File extension of this file will be txt.
    public var restrictedWordsFileName = ""

    /// The regular expression pattern that will be used to
    /// match the text that the user is sending. By default, it's empty.
    ///
    /// This will be combined with the restricted words config option,
    /// which means if the text is matched with the restricted words or
    /// through this pattern, then an alert will be shown.
    ///
    /// NOTE: Make sure you verify this pattern before setting
    /// up here.
    public var restrictedMessageRegexPattern = ""

    /// This will show info option in action sheet
    /// when a profile is tapped in group detail screen.
    /// Clicking on the option will send a notification outside.
    /// Nothing else will be done from our side.
    public var showInfoOptionInGroupDetail: Bool = false

    /// If true, swipe action in chatcell to delete/mute conversation will be disabled.
    public var disableSwipeInChatCell: Bool = false

    /// Use this to customize chat input bar items like attachment
    /// button icons or their visibility.
    public var chatBar = ALKChatBarConfiguration()

    /// Right  Navigation bar items in conversation list view
    public var navigationItemsForConversationList = [ALKNavigationItem]() {
        didSet {
            let prefixArray = navigationItemsForConversationList.prefix(2)
            navigationItemsForConversationList = Array(prefixArray)
            print("Two navigation buttons are supported in Conversation List")
        }
    }

    /// Right  Navigation bar items in conversation  view controller
    public var navigationItemsForConversationView = [ALKNavigationItem]() {
        didSet {
            let prefixArray = navigationItemsForConversationView.prefix(2)
            navigationItemsForConversationView = Array(prefixArray)
            print("Two navigation buttons are supported in Conversation View")
        }
    }

    // If false, Then  you can disable the default refresh button in chat view
    public var isRefreshButtonEnabled: Bool = true

    // If true then the mention feature in groups will be enabled
    // and it can be triggered by typing "@" character in the message
    // input view. Default value is false.
    public var isMemberMentionEnabled = false

    // If true, Then message search will be enabled
    public var isMessageSearchEnabled: Bool = false

    // If true, then in-app notification banner will be disabled
    public var isInAppNotificationBannerDisabled: Bool = false

    // If true, then link preview will be disabled
    public var isLinkPreviewDisabled: Bool = false

    /// If true, then the new iOS Photos UI would be shown in iOS 14+ devices.
    /// It handles content restrictions in iOS 14 and above.
    /// Default value is false.
    public var isNewSystemPhotosUIEnabled = false

    /// Set the message menu options to show on the message long tap.
    public var messageMenuOptions: [ALKMessageCell.MenuOption] = [.copy]
    
    // If true then TTS(Text To Speech) is enabled. It is false by default.
    public var enableTextToSpeechInConversation: Bool = false
        
    // If true then Navigation bar will be hidden. By default it is false
    public var hideNavigationBarOnChat : Bool = false
    
    // If false then new conversation button (at bottom) will not be visible. By default it is true.
    public var hideBottomStartNewConversationButton: Bool = false
    
    // If true then arrow will be shown on conversartion list screen. if false then back text will be shown. By default it is true.
    public var enableBackArrowOnConversationListScreen: Bool = true

    /// If true then click action on Add Participant in group will disabled.
    /// After disabling you can handle it from outside by observing ALKNotification.createGroupAction
    public var disableAddParticipantButton = false
    
    /// If true then feedback will be asked only once in a conversation
    /// if false then feedback will be asked  everytime the conversation is resolved
    public var oneTimeRating = false
    
    /// Use this to configure channel detail view like changing member name label color, title font etc.
    public var channelDetail = ALKChannelDetailViewConfiguration()

    /// If true then restart button will be shown after conversation gets resolved. End user can restart the conversation.
    /// If false restart button won't be shown & end user can't resart the resolved conversation. By default it is false.
    public var hideRestartConversationButton = false
    
    /// If true, rate conversation button will be visible on ConversationVC, By default it is false.
    public var rateConversationMenuOption = false
   
   /// List of languages for speech to text.
    public var languagesForSpeechToText : [KMLanguage] = []

    /// if false then chat  will be popped up on helpcenter(FAQ) page, By default it is true.
    public var hideChatInHelpcenter: Bool = true

    public var conversationInfoModel : KMConversationInfoViewModel?
    
    /// if true then delete option will be enabled for end user on long press, By default it is false
    public var enableDeleteConversationOnLongpress : Bool = false
    
    /// if true then webview will be pushed once formaction url returns with response, By default it is false
    public var pushWebviewWithFormActionResponse = false
    
    /// If true then on tap of list template(link) browser will not be opened. By default it is false
    public var restrictLinkNavigationOnListTemplateTap = false


    /// If true, contact share option in chatbar will be hidden.
    @available(*, deprecated, message: "Use .chatBar.optionsToShow instead")
    public var hideContactInChatBar: Bool = false {
        didSet {
            guard hideContactInChatBar else { return }
            chatBar.optionsToShow = .some([.gallery, .location, .camera, .video])
        }
    }

    /// If true then all the media options in Chat bar will be hidden.
    @available(*, deprecated, message: "Use .chatBar.optionsToShow instead")
    public var hideAllOptionsInChatBar = false {
        didSet {
            guard hideAllOptionsInChatBar else { return }
            chatBar.optionsToShow = .none
        }
    }

    /// conversationlist view navigation icon for right side.
    /// By default, create group icon image will be used.
    @available(*, deprecated, message: "Use navigationItemsForConversationList instead")
    public var rightNavBarImageForConversationListView = UIImage(named: "fill_214", in: Bundle.km, compatibleWith: nil)

    /// If true then click action on navigation icon in conversation list view will be handled from outside
    @available(*, deprecated, message: "Use navigationItemsForConversationList instead")
    public var handleNavIconClickOnConversationListView = false

    /// Notification name for navigation icon click in conversation list
    @available(*, deprecated, message: "Use navigationItemsForConversationList instead it has identifier in ALKNavigationItem")
    public var nsNotificationNameForNavIconClick = "handleNavigationItemClick"

    /// Date cell and  information cell  background color
    @available(*, deprecated, message: "Use ALKMessageStyle for customization.")
    public var conversationViewCustomCellBackgroundColor = UIColor.gray {
        didSet {
            let infoMessageStyle = ALKMessageStyle.infoMessage
            let dateCellStyle = ALKMessageStyle.dateSeparator
            ALKMessageStyle.infoMessage = Style(font: infoMessageStyle.font, text: conversationViewCustomCellTextColor, background: conversationViewCustomCellBackgroundColor)
            ALKMessageStyle.dateSeparator = Style(font: dateCellStyle.font, text: conversationViewCustomCellTextColor, background: conversationViewCustomCellBackgroundColor)
        }
    }

    /// Date cell and  information cell  text color
    @available(*, deprecated, message: "Use ALKMessageStyle for customization.")
    public var conversationViewCustomCellTextColor = UIColor.white {
        didSet {
            let infoMessageStyle = ALKMessageStyle.infoMessage
            let dateCellStyle = ALKMessageStyle.dateSeparator
            ALKMessageStyle.infoMessage = Style(font: infoMessageStyle.font, text: conversationViewCustomCellTextColor, background: conversationViewCustomCellBackgroundColor)
            ALKMessageStyle.dateSeparator = Style(font: dateCellStyle.font, text: conversationViewCustomCellTextColor, background: conversationViewCustomCellBackgroundColor)
        }
    }

    /// If true, then the message report option will be visible.
    @available(*, deprecated, message: "Use messageMenuOptions to show/hide different menu options.")
    public var isReportMessageEnabled = false {
        didSet {
            guard isReportMessageEnabled, !messageMenuOptions.contains(.report) else { return }
            messageMenuOptions.append(.report)
        }
    }

    public init() {}
}
