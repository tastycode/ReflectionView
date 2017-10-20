import Foundation
import UIKit

@objc class ReflectionView: UIView {

    var replicator: CAReplicatorLayer!


    override class var layerClass: AnyClass {
        get {
            return CAReplicatorLayer.self
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()

    }

    override func awakeFromNib() {
        setup()
    }

    func setup() {
        self.replicator = self.layer as! CAReplicatorLayer
        var transform : CATransform3D = CATransform3DIdentity
        let horizontalOffset : CGFloat = bounds.size.width
        transform = CATransform3DTranslate(transform, horizontalOffset, 0.0, 0.0)

        replicator.instanceCount = 2

        replicator.instanceTransform = transform
    }
}
