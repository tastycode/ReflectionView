# ReflectionView

![2017-10-19 23 09 58](https://user-images.githubusercontent.com/809953/31804946-b2dd63dc-b522-11e7-9314-41fba2cd93f8.gif)
(ReflectionView running in ARKitExample)

Have a complex rendering pipeline? Is the end-result of your pipeline a
single UIView? Do you need that view to present itself as two duplicate
views so the view will appear as a single image when viewed through a VR
headset?

You've found the most useful highly niche library for AR/VR yet. 

I've used this to:
- Replicate a react-native rendered app overlay for stereoscopic
  presentation
- Replicate an ARKit renderer and allow "stereoscopic on rotation"
  experiences.


# How to use 

1. Create constraints so that the ReflectionView instance takes half the screen
2. Put the views you want doubled inside the ReflectionView

![image](https://user-images.githubusercontent.com/809953/31804867-1ba801f2-b522-11e7-8736-918a808091ea.png)


## Auto-flipping on rotation

You'll need to create two layouts, one for portrait, another for landscape. See https://medium.com/@craiggrummitt/size-classes-in-interface-builder-in-xcode-8-74f20a541195. 

Then you'll need something like this: 

```swift
  override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
    coordinator.animate(alongsideTransition: { (_) in
        let orient = UIApplication.shared.statusBarOrientation

        switch orient {
        case .portrait:
            self.reflectionView.replicator.instanceCount = 1
         default:
            self.reflectionView.replicator.instanceCount = 2
        }
    }, completion: nil)

    super.willTransition(to: newCollection, with: coordinator)
  }
  ```

# Apps using this library

- [Tastyglass](https://itunes.apple.com/us/app/tastyglass/id1029277726?mt=8)

# License

[MIT](https://opensource.org/licenses/MIT)

# Feeling thankful?

BTC: 1NEf77g7aFpsLGXf88ie1Bueze7QxbH2mN
ETH: 0x428D3ebACfe19a33B6265C20FFffb25cEB45df0A

Twitter: [@tastycode](https://twitter.com/tastycode)
