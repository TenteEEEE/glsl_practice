# シェーダ何もわからん
だから書く  
[自分のチャンネル in glslfan.com](https://glslfan.com/?channel=-Li5ShWGghKAqruWFN3s)  

## 楽々開発環境
AtomならWebGLみたいなのが楽に動くんやない？と思ったらやっぱりあった。  

[Atom](https://atom.io/)をインストール。  
Atomを起動して以下のパッケージをインストールするだけ。  
[glsl-preview](https://atom.io/packages/glsl-preview), [language-glsl](https://atom.io/packages/language-glsl), 追加で[autocomplete-glsl](https://atom.io/packages/autocomplete-glsl)もあると捗るかも。  
あとはシェーダコードを書いて `ctrl + shift + g` でライブプレビューできる。つおい。

# 履歴
[Practice1](./src/practice1.glsl) : 時間とマウス座標に合わせて画面の色を変える  
[Practice2](./src/practice2.glsl) : マウス座標に合わせてレイマーチングした円の大きさと視点深さ、円の大きさは時間に合わせて鼓動もする  
[Practice3](./src/practice3.glsl) : mod演算による複製、擬似乱数による円の振動、深度で色をゆるやかに変えるレイマーチングスフィア    
[Practice4](./src/practice4.glsl) : ランダムなマップを作成し、マウス座標でマス目ごとに乱数のパターンを変える    
[Practice5](./src/practice5.glsl) : レイマーチングの結果からノーマルマップを計算、複数のオブジェクトの組み合わせ    

# 役に立った参考リンク
1. [シェーダライブコーディングのすすめ](https://docs.google.com/presentation/d/1n_L8VJZs-Ig4FrlaUe5X2dhFB77ZPbiDBirjkoM4Afc/edit#slide=id.g5993dc7d82_11_4)  
1. [ビルトイン関数の使い方いろいろ！シェーダアートの表現力を高める小技集](https://docs.google.com/presentation/d/12RrqyAkFanKmfL96ZHvhDCozE-_rKFPlU1YVwej4_bc/edit#slide=id.g3f05883db8_0_46)  
1. [Media Lab 2018 第8回 : Shader (GLSL) によるGPUプログラミング](https://drive.google.com/file/d/101oAJTRFRLdpBVN15-uTZx8B3AQewv_S/view)  
1. [GLSL - Declaring global variables outside of the main function scope](https://gamedev.stackexchange.com/questions/61257/glsl-declaring-global-variables-outside-of-the-main-function-scope)  
1. [GLSL レイマーチング入門 vol.1](https://qiita.com/edo_m18/items/034665d42c562da88cb6)  
1. [GLSL SandBoxで手軽にレイマーチングで遊ぼう](https://hackerslab.aktsk.jp/2018/12/01/131928)  
1. [The Book of Shaders](https://thebookofshaders.com/) これは神資料かも？  
1. [Can I generate a random number inside a pixel shader?](https://stackoverflow.com/questions/5149544/can-i-generate-a-random-number-inside-a-pixel-shader)  
