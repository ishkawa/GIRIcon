#import "ISHView.h"
#import "ISHArcView.h"
#import "ISHPinView.h"

@implementation ISHView

+ (Class)layerClass
{
    return [CAGradientLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ISHArcView *arcView = [[ISHArcView alloc] initWithFrame:self.bounds];
        ISHPinView *pinView = [[ISHPinView alloc] initWithFrame:self.bounds];
        
        [self addSubview:arcView];
        [self addSubview:pinView];
        
        CAGradientLayer *layer = (CAGradientLayer *)self.layer;
        UIColor *topColor = [UIColor colorWithRed:26.f  / 255.f
                                            green:214.f / 255.f
                                             blue:253.f / 255.f
                                            alpha:1.f];
        
        UIColor *bottom = [UIColor colorWithRed:29.f  / 255.f
                                          green:98.f  / 255.f
                                           blue:240.f / 255.f
                                          alpha:1.f];
        
        layer.colors = @[(id)topColor.CGColor, (id)bottom.CGColor];
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 112.f;
//        self.layer.borderWidth = 1.f;
//        self.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1.f].CGColor;
    }
    return self;
}

@end
