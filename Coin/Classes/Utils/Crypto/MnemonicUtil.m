//
//  MnemonicUtil.m
//  Coin
//
//  Created by haiqingzheng on 2018/6/6.
//  Copyright © 2018年 chengdai. All rights reserved.
//

#import "MnemonicUtil.h"
#import "Coin-Swift.h"
#import "AppColorMacro.h"
@implementation MnemonicUtil

+ (void)test{
    
    NSString *mnenomic = [EthCrypto generateMnemonics];
//    mnenomic = @"cube oil need license stove style act drive kit ship claw rapid";
    
    NSString *privateKey = [EthCrypto getPrivateKey:mnenomic];
    
    NSString *address = [EthCrypto getAddressWithPrivateKey:privateKey];
//    BOOL is = [EthCrypto is:mnenomic];
//    NSLog(@"%d",is);
    NSLog(@"mnenomic=%@", mnenomic);
    NSLog(@"privateKey=%@", privateKey);
    NSLog(@"address=%@", address);
//    NSString *gasP = [EthCrypto mn];

    NSString *gasPrice = [EthCrypto getGasPrice];
    NSLog(@"%@", gasPrice);
    NSString *word = [[NSUserDefaults standardUserDefaults] objectForKey:KWalletWord];
    NSString *toAddress = [[NSUserDefaults standardUserDefaults] objectForKey:KWalletAddress];
    long inter  = 3*100000000000000000;
    NSString *gprice = [NSString stringWithFormat:@"%ld",inter];
    
    NSString * result = [EthCrypto sendTransactionWithMnemonic:word to:toAddress amount:@"3" gasPrice:gprice gasLimit:@"21000"];
    NSLog(@"%@",result);
    
}

+(NSString *)getGasPrice
{
    return [EthCrypto getGasPrice];
    
    
}
+(NSString *)getWanGasPrice
{
    return [EthCrypto getWanGasPrice];

}

+(NSString*)getMnemonicsISRight:(NSString *)mnemon
{
    
    return [EthCrypto isValidMnemonice:mnemon];

}
+(NSString *)sendTransactionWithMnemonicWallet:(NSString *)wallet address:(NSString *)address amount:(NSString *)amount gaspic:(NSString *)gasPric gasLimt:(NSString *)gasLimt
{
    
    NSString *str = [EthCrypto sendTransactionWithMnemonic:wallet to:address amount:amount gasPrice:gasPric gasLimit:gasLimt];
    
    return str;
}

+(NSString *)sendWanTransactionWithMnemonicWallet:(NSString *)wallet address:(NSString *)address amount:(NSString *)amount gaspic:(NSString *)gasPric gasLimt:(NSString *)gasLimt
{
    
    NSString *str = [EthCrypto sendWanTransactionWithMnemonic:wallet to:address amount:amount gasPrice:gasPric gasLimit:gasLimt];
    return str;
}


+(NSString *)getGenerateMnemonics
{
    
    return [EthCrypto generateMnemonics];
}

+(NSString *)getPrivateKeyWithMnemonics:(NSString *)mnemonics
{
    
    return [EthCrypto getPrivateKey:mnemonics];
    
}

+(NSString *)getAddressWithPrivateKey:(NSString *)privateKey
{
    
    return [EthCrypto getAddressWithPrivateKey:privateKey];
}

+ (NSString * )getEthTokenGasPrice
{
    
    return [EthCrypto getETHTokenPrice];
    
}

//+ (BTCMnemonic *)generateNewMnemonic {
//    BTCMnemonic *mnemonic =  [[BTCMnemonic alloc] initWithEntropy:BTCRandomDataWithLength(16) password:nil wordListType:BTCMnemonicWordListTypeEnglish];
//    return mnemonic;
//}
//
//+ (BTCMnemonic *)importMnemonic:(NSArray *)wordList {
//    BTCMnemonic *mnemonic =  [[BTCMnemonic alloc] initWithWords:wordList password:nil wordListType:BTCMnemonicWordListTypeEnglish];
//    return mnemonic;
//}
//
//+ (NSString *)getBtcPrivateKey:(BTCMnemonic *)mnemonic {
//    BTCKeychain *keychain = [mnemonic keychain];
//    return keychain.key.privateKeyAddress.string;
//}
//
//+ (NSString *)getBtcAddress:(BTCMnemonic *)mnemonic {
//    BTCKeychain *keychain = [mnemonic keychain];
//    return keychain.key.address.string;
//}
//
//+ (NSString *)getEthPrivateKey:(BTCMnemonic *)mnemonic {
//    BTCKeychain *keychain = [mnemonic keychain];
//    keychain = [keychain derivedKeychainWithPath:@"m/44'/1'/2'"];
//    
//    return keychain.key.privateKeyAddress.string;
//}
//
//+ (NSString *)getEthAddress:(BTCMnemonic *)mnemonic {
//    BTCKeychain *keychain = [mnemonic keychain];
//    keychain = [keychain derivedKeychainWithPath:@"m/44'/1'/2'"];
//    return [NSString stringWithFormat:@"0x%@", keychain.key.address.string];
//}

@end
