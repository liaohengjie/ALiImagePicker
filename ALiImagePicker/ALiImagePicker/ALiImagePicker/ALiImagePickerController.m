//
//  ALiImagePickerController.m
//  ALiImagePicker
//
//  Created by LeeWong on 2016/10/15.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

#import "ALiImagePickerController.h"
#import "ALiImagePickFooterView.h"
#import "ALiImageCell.h"

static  NSString *kArtImagePickerCellIdentifier = @"ALiImageCell";
static  NSString *kArtAssetsFooterViewIdentifier = @"ALiImagePickFooterView";

@interface ALiImagePickerController () <UICollectionViewDelegate,UICollectionViewDataSource>

//UI
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

//Data
@property (nonatomic, strong) NSMutableArray *assets;

@end

@implementation ALiImagePickerController

#pragma mark - Custom Method

#pragma mark - Load Data

#pragma mark - Load View


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.assets.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ALiAsset *asset = self.assets[indexPath.item];
    
    ALiImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kArtImagePickerCellIdentifier forIndexPath:indexPath];
    [cell configImageCell:asset];
    return cell;
}




#pragma mark - Lazy Load

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[ALiImageCell class] forCellWithReuseIdentifier:kArtImagePickerCellIdentifier];
        [_collectionView registerClass:[ALiImagePickFooterView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                   withReuseIdentifier:kArtAssetsFooterViewIdentifier];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_collectionView];

    }
    
    return _collectionView;
}

- (UICollectionViewFlowLayout *)layout
{
    if (_layout == nil) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 2.0;
        _layout.minimumInteritemSpacing = 2.0;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _layout;
}

@end
