



import SwiftUI


struct ShowView: View {
    
    @State var objeto : Monstro
    
  
    
    
    var body: some View {
            
            NavigationStack{
                ScrollView{
                    VStack{
                        
                        Spacer()
                        Spacer()
                        
                        
                        AsyncImage(url: URL(string: objeto.hdurl ?? "")){ result in
                            result.image?.resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                        
                        Spacer()
                        HStack{
                            Text("\(objeto.name ?? "")").font(.largeTitle)
                            Text("\(objeto.cr ?? 0)")
                        }
                        Spacer()
                        VStack{
                            
                            Text(" \(objeto.size ?? "") \(objeto.type ?? "")")
                            Text(" \(objeto.skill ?? "")")
                            Text("\(objeto.resistances ?? "")")
                            Text("\(objeto.immunities ?? "")")
                            Text("\(objeto.senses ?? "")")
                            Text("\(objeto.languages ?? "")")
                        }
                        
                        VStack{
                            Text("STR DEX CON INT WIS CHA")
                            Text("\(objeto.str) \(objeto.dex) \(objeto.con) \(objeto.int) \(objeto.sab) \(objeto.car )")
                            
                        }
                        VStack{
                            Text("\(objeto.traits ?? "")")
                            Text("\(objeto.actions ?? "")")
                        }
                    }
                }.background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white, Color.black]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea()
            }
            
        }}



#Preview {
    ShowView(objeto: Monstro(
        _id: "000",
        _rev: "öoo",
        name: "Aboleth",
            cr: 10,
            size: "Large",
            type: "Aberration",
            CA: "17 (natural armor)",
            HP: 165,
            speed: "10 ft., swim 40 ft.",
            skill: "Perception 20, Stealth 9",
            resistances: "acid | Aberrant Resilience",
            immunities: "psychic",
            senses: "darkvision 120 ft.",
            languages: "Deep Speech, telepathy 120 ft.",
            str: 5,
            dex: -1,
            con: 6,
            int: 8,
            sab: 6,
            car: 4,
            traits: """
                Aberrant Resilience. The aboleth is resistant to the charmed, frightened, paralyzed, and stunned conditions, and it has advantage on saves against spells or effects that would alter its form.
                Amphibious. The aboleth can breathe air and water.
                Legendary Resistance (3/Day). If the aboleth fails a save, it can choose to succeed instead.
                Probing Telepathy. If a creature the aboleth can see communicates telepathically with the aboleth, the aboleth learns the creature’s greatest desires.
                Slime Pox. Characterized by the slimy pustules that erupt across the victim’s body, slime pox is a disease that infects creatures attacked by an aboleth or that come into contact with an aboleth’s slime. Until the disease is cured, the infected creature can breathe air and water, can’t regain HP except when underwater, and takes 6 (1d12) acid damage for every 1 hour it remains outside of water or without moisture applied to its skin. Every 24 hours that elapse, the infected creature must make a DC 16 CHA save. Each time a creature fails this save, it views the infecting aboleth more and more favorably, becoming the aboleth’s doting and protective thrall after three failed saves. The successes and failures don’t need to be consecutive, but once a creature has acquired three of a kind, it no longer has to make this save, resulting in either the creature becoming a thrall of the aboleth or an autonomous—though infected—creature. Slime pox can be cured only by the heal spell or similar magic.
                Slimy Skin. The aboleth is coated in an otherworldly mucus. A creature that touches the aboleth or that hits it with a melee attack while within 5 feet of it must succeed on a DC 16 CON save or be infected with slime pox (see the Slime Pox trait).
                """,
            actions: """
                ACTIONS
                Multiattack. The aboleth makes three Tentacle or Psychic Bolt attacks. If two Tentacle attacks hit one target, the target must succeed on a DC 16 CON save or contract the slime pox disease (see the Slime Pox trait).
                Tentacle. Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit: 15 (3d6 + 5) bludgeoning damage.
                Psychic Bolt. Ranged Spell Attack: +8 to hit, range 120 ft., one target. Hit: 14 (3d6 + 4) psychic damage.
                Psychic Torrent (Recharge 5–6). The aboleth floods the minds of up to three creatures it can see within 60 feet of it with random and horrific memories from its eons-long life. Each target must make a DC 16 WIS save. On a failure, a creature takes 49 (14d6) psychic damage and is incapacitated until the end of its next turn, as its mind reels from the torrent of images, thoughts, and memories. On a success, a creature takes half the damage and isn’t incapacitated.
                
                LEGENDARY ACTIONS
                Detect. The aboleth automatically detects every creature and trap within 60 feet of it, pinpointing the current location of each.
                Swim. The aboleth swims up to half its speed without provoking opportunity attacks.
                Slime Drain (Costs 2 Actions). One creature infected with slime pox within 30 feet of the aboleth takes 10 (3d6) acid damage, and the aboleth regains HP equal to the damage the creature takes.
                """,
                hdurl: "https://upload.wikimedia.org/wikipedia/pt/e/e2/Inspetor_faust%C3%A3o_e_o_mallandro.jpg"
            ))
}
