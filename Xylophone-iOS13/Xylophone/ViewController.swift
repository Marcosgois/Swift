import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(title: sender.currentTitle!)
    }
    
    func playSound(title : String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let url = Bundle.main.url(forResource: title, withExtension: "wav")
            self.player = try! AVAudioPlayer(contentsOf: url!)
            self.player.play()
         }
        
                
    }
}
