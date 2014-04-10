#import "ISHArcView.h"

@implementation ISHArcView

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
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
        shapeLayer.lineWidth = 37.5f;
    }
    return self;
}

- (UIBezierPath *)path
{
    CGPoint center = CGPointMake(self.center.x, self.center.y + 96.f);
    CGFloat interval = 75.f;
    CGFloat radius = 250.f;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    while (radius > interval) {
        [self addArcToPath:path center:center radius:radius];
        radius -= interval;
    }
    
    return path;
}

- (void)addArcToPath:(UIBezierPath *)path
              center:(CGPoint)center
              radius:(CGFloat)radius
{
    CGFloat startAngle = -M_PI_2 - M_PI_2 * 0.425f;
    CGFloat endAngle   = -M_PI_2 + M_PI_2 * 0.425f;
    
    [path moveToPoint:CGPointMake(center.x + radius * cosf(startAngle), center.y + radius * sinf(startAngle))];
    [path addArcWithCenter:center
                    radius:radius
                startAngle:startAngle
                  endAngle:endAngle
                 clockwise:YES];
   
}

@end