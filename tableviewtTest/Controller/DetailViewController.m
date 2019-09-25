//
//  DetailViewController.m
//  tableviewtTest
//
//  Created by 天行者 on 2019/9/9.
//  Copyright © 2019 天行者. All rights reserved.
//

#import "DetailViewController.h"
#import <WebKit/WebKit.h>
@interface DetailViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, copy) NSString *url;
@end

@implementation DetailViewController

- (instancetype)initWithUrlSting:(NSString *)urlString{
    self = [super init];
    if (self) {
        _url = urlString;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, self.view.bounds.size.height - 88)];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
        self.webView.navigationDelegate = self;
        [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        self.webView;
        
    })];
    
    [self.view addSubview:({
        
        //直接设置progressView的宽高是无效的,可以通过设置transform来实现
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88,self.view.frame.size.width,4)];
        self.progressView.transform = CGAffineTransformMakeScale(1.0f, 10.0f);

        self.progressView.progressTintColor = [UIColor redColor];
        self.progressView;
    })];
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    decisionHandler(WKNavigationActionPolicyAllow);
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"加载完成");
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    self.progressView.progress = self.webView.estimatedProgress;
}

- (void)dealloc{
    
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
@end
