//
//  CarouselView.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 26.06.2025.
//

import SwiftUI

struct CarouselView<Content: View, T: Hashable>: View {
    @State private var selection: T?
    
    @ViewBuilder var content: (T) -> Content
    
    var items: [T]

    init(@ViewBuilder content: @escaping (T) -> Content, data: [T]) {
        self.content = content
        items = data
    }

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(items, id: \.self) { avatar in
                        content(avatar)
                            .containerRelativeFrame(.horizontal)
                            .scrollTransition(.interactive.threshold(.visible(0.9)), transition: { content, phase in
                                content.scaleEffect(phase.isIdentity ? 1 : 0.8)
                            })
                            .id(avatar)
                    }
                }
            }
            .frame(height: 200)
            .scrollIndicators(.hidden)
            .scrollTargetLayout()
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $selection)
            .onChange(of: items.count, { _, _ in
                updateSelectionIfNeeded()
            })
            .onAppear {
                updateSelectionIfNeeded()
            }
            
            HStack {
                ForEach(items, id: \.self) { avatar in
                    Circle()
                        .fill(selection == avatar ? .accent : .secondary.opacity(0.5))
                        .frame(width: 8)
                }
            }
            .animation(.linear, value: selection)
        }
    }
    
    private func updateSelectionIfNeeded() {
        guard selection == nil || selection == items.last else { return }
        self.selection = self.items.first
    }
}

#Preview {
    let items: [AvatarModel] = AvatarModel.mocks
    
    CarouselView(content: { avatar in
        HeroCellView(title: avatar.name, subtitle: avatar.characterDescription, imageName: avatar.profileImageName)
                                // bu modifier iyiymiş !!!!!
                                   
    }, data: items)
}

// MARK: Modifiers

/*
 .containerRelativeFrame(.horizontal)
 🔹 Ne yapar?
 Bu modifier, view’in scroll container’ı içinde yatay eksende kendini nasıl konumlandıracağını tanımlar.
 Özellikle .scrollTargetLayout() kullandığında etkili olur:

 containerRelativeFrame(.horizontal) diyerek bu view’i, yatay scroll konteyner’ı içinde hedef alınabilir (scroll hedefi) bir frame’e sahip hale getiriyorsun.

 Böylece scrollTargetBehavior(.paging) gibi özelliklerle birlikte view, düzgün bir şekilde sayfa gibi kayar.

 📝 Özetle:

 ScrollView’de bu view’in konumunu scroll container’a göre ayarlamak ve düzgün paging hedefleri elde etmek için kullanılır.

 ********************************************************
 .scrollTransition(...)
 🔹 Ne yapar?
 Scroll sırasında bir view’in görünürlük eşiği (threshold) geçtiğinde nasıl bir animasyon uygulanacağını tanımlar.

 🔹 Kullandığın örnek:

 .scrollTransition(.interactive.threshold(.visible(0.9)), transition: { content, phase in
     content.scaleEffect(phase.isIdentity ? 1 : 0.8)
 })
 🔹 Bu ne demek?

 .interactive.threshold(.visible(0.9)):

 View’in %90’ı görünür olduğunda geçiş başlar.

 transition: { content, phase in ... }:

 Burada phase scroll aşamasını (ör. görünür/görünmez) bildirir.

 phase.isIdentity true ise, view tamamen görünür durumda → scale 1 (normal boyut).

 Aksi halde scale 0.8 (küçük göster).

 Bu sayede scroll ederken hücrelerin kaybolurken küçülmesini, ortaya gelirken büyümesini sağlayan yumuşak ve dikkat çekici bir efekt oluşturursun.

 📝 Özetle:

 ScrollView’de view’in kaydırma sırasında hangi eşikte nasıl bir animasyon geçireceğini tanımlamak için kullanılır. Harika bir UX detayı!

 🎥 Kısaca
 🔹 containerRelativeFrame(.horizontal) → Scroll paging hedefleri için view’in scroll container’daki frame’ini ayarlar.
 🔹 scrollTransition(...) → Scroll sırasında interaktif geçiş animasyonu tanımlar, görünürlük oranına göre view’e efekt uygular.
 */
