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
        
        [self save];
    }
    return self;
}

- (void)save
{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"icon.png"];
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:path atomically:YES];
    
    NSLog(@"saved: %@", path);
}

@end
