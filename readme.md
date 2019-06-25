# シェーダ何もわからん
だから書く

## 楽々開発環境
AtomならWebGLみたいなのが楽に動くんやない？と思ったらやっぱりあった。  

[Atom](https://atom.io/)をインストール。  
Atomを起動して以下のパッケージをインストールするだけ。  
[glsl-preview](https://atom.io/packages/glsl-preview), [language-glsl](https://atom.io/packages/language-glsl), 追加で[autocomplete-glsl](https://atom.io/packages/autocomplete-glsl)もあると捗るかも。  
あとはシェーダコードを書いて `ctrl + shift + g` でライブプレビューできる。つおい。

# 履歴
[Practice1](./src/practice1.vert) : 時間とマウス座標に合わせて画面の色を変える  
[Practice2](./src/practice2.vert) : マウス座標に合わせてレイマーチングした円の大きさと視点深さ、円の大きさは時間に合わせて鼓動もする  

# 役に立った参考リンク
1. [シェーダライブコーディングのすすめ](https://docs.google.com/presentation/d/1n_L8VJZs-Ig4FrlaUe5X2dhFB77ZPbiDBirjkoM4Afc/edit#slide=id.g5993dc7d82_11_4)  
1. [ビルトイン関数の使い方いろいろ！シェーダアートの表現力を高める小技集](https://docs.google.com/presentation/d/12RrqyAkFanKmfL96ZHvhDCozE-_rKFPlU1YVwej4_bc/edit#slide=id.g3f05883db8_0_46)  
1. [Media Lab 2018 第8回 : Shader (GLSL) によるGPUプログラミング](https://drive.google.com/file/d/101oAJTRFRLdpBVN15-uTZx8B3AQewv_S/view)  
1. [GLSL - Declaring global variables outside of the main function scope](https://gamedev.stackexchange.com/questions/61257/glsl-declaring-global-variables-outside-of-the-main-function-scope)  
1. [GLSL レイマーチング入門 vol.1](https://qiita.com/edo_m18/items/034665d42c562da88cb6)  
