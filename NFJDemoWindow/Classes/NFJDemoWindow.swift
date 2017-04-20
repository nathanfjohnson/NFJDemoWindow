/** Copyright (c) 2017 Nathan F Johnson <nathanfjohnson@me.com>

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
 documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
 rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
 persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
 Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 */

import UIKit

/// A subclass of UIWindow wich will show all the touches a user makes.
public class NFJDemoWindow: UIWindow {

  /// The color of the touch incicators.
  public var demoColor = #colorLiteral(red: 0.8745098039, green: 0.337254902, blue: 0.1450980392, alpha: 1)

  /// The diameter of the circle.
  public var circleDiamiter: CGFloat = 45

  /// When true, the indicators will show, when false, NFJDemoWindow is just a normal UIWindow
  public var activated = true {
    didSet {
      guard !activated else { return }
      for touchIndicator in touchIndicators {
        touchIndicator.view.removeFromSuperview()
      }
      touchIndicators.removeAll()
    }
  }

  /// Here we hold onto all the touchIndicators
  private var touchIndicators = [(touch: UITouch, view: UIView)]()

  override open func sendEvent(_ event: UIEvent) {
    super.sendEvent(event )
    if activated && event.type == .touches, let allTouches = event.allTouches {
      for touch in allTouches {
        updateIndicators(withTouch: touch)
      }
    }
  }

  private func updateIndicators(withTouch touch: UITouch) {
    switch touch.phase {

    case .began:
      addIndicatorView(forTouch: touch)

    case .moved:
      moveIndicatorViews(forTouch: touch)

    case .stationary: break // we do nothing for stationary

    default:
      purgeIndicatorViews(withTouch: touch)
    }
  }

  /// Add a new indicator view on the window at the touch's location.
  private func addIndicatorView(forTouch touch: UITouch) {
    let touchLocation = touch.location(in: self)
    let view = UIView()
    view.frame = CGRect(x: touchLocation.x - (circleDiamiter/2),
                        y: touchLocation.y - (circleDiamiter/2),
                        width: circleDiamiter,
                        height: circleDiamiter)
    view.backgroundColor = demoColor.withAlphaComponent(0.75)
    view.layer.cornerRadius = circleDiamiter/2
    view.layer.zPosition = 1000
    view.layer.borderColor = demoColor.cgColor
    view.layer.borderWidth = 0
    view.isUserInteractionEnabled = false
    addSubview(view)
    touchIndicators.append(touch: touch, view: view)
  }

  /// This will move the indicator associated with the touch to its new location.
  private func moveIndicatorViews(forTouch touch: UITouch) {
    for touchIndicator in touchIndicators where touchIndicator.touch == touch {
      let touchLocation = touch.location(in: self)
      touchIndicator.view.frame = CGRect(x: touchLocation.x - (circleDiamiter/2),
                                         y: touchLocation.y - (circleDiamiter/2),
                                         width: circleDiamiter,
                                         height: circleDiamiter)
    }
  }

  /// This will the indicator of the ended touch (with animation)
  private func purgeIndicatorViews(withTouch touch: UITouch) {
    var indicatorToDeleteIndex: Int?
    for (index, touchIndicator) in touchIndicators.enumerated() where touchIndicator.touch == touch {
      indicatorToDeleteIndex = index
      touchIndicator.view.backgroundColor = UIColor.clear
      UIView.animate(withDuration: 0.25,
                     delay: 0,
                     options: UIViewAnimationOptions.curveEaseOut,
                     animations: { () -> Void in

                      touchIndicator.view.transform = CGAffineTransform(scaleX: 2, y: 2)
                      touchIndicator.view.layer.borderWidth = 3
                      touchIndicator.view.alpha = 0

      }, completion: { _ in
        touchIndicator.view.removeFromSuperview()
      })
    }
    if let indicatorToDeleteIndex = indicatorToDeleteIndex {
      touchIndicators.remove(at: indicatorToDeleteIndex)
    }
  }
}
