#import "ISHPinView.h"

@implementation ISHPinView

+ (Class)layerClass
{
    return [CAShapeLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
        shapeLayer.path = [self path].CGPath;
        shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    }
    return self;
}

- (UIBezierPath *)path
{
    CGPoint origin = CGPointMake(self.center.x, self.center.y + 61.f);
    CGFloat width = 35.f;
    CGFloat height = 125.f;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:origin];
    [path addLineToPoint:CGPointMake(origin.x + width, origin.y + height)];
    [path addLineToPoint:CGPointMake(origin.x,         origin.y + height * 0.8f)];
    [path addLineToPoint:CGPointMake(origin.x - width, origin.y + height)];
    [path addLineToPoint:origin];
    
    return path;
}

@end
