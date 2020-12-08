

import AVKit

class VideoPlayer: NSObject {
    var player: AVPlayer = {
        let videoDemoURL = Bundle.main.url(forResource: "rain", withExtension: "mp4")!
        return AVPlayer(url: videoDemoURL)
    }()
    lazy var playerViewController: AVPlayerViewController = {
        var playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.delegate = self
        playerViewController.allowsPictureInPicturePlayback = false
        playerViewController.entersFullScreenWhenPlaybackBegins = true
        return playerViewController
    }()
    
    @objc
    func enterForeground() {
        self.playerViewController.player = player
    }
    
    @objc
    func enterBackground() {
        let pipInactive = !playerViewController.allowsPictureInPicturePlayback
        if pipInactive {
            self.playerViewController.player = nil
        }
    }
    
}

extension VideoPlayer: AVPlayerViewControllerDelegate {
    func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("START playerViewControllerDidStartPictureInPicture")
    }
    
    func playerViewControllerDidStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("STOP playerViewControllerDidStopPictureInPicture")
    }
}
