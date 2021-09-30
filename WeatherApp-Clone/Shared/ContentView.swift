//
//  ContentView.swift
//  Shared
//
//  Created by MacBook Pro on 24.09.2021.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        ZStack {
            
            Image("background-sky")
            ScrollView(){
                VStack {
                    MainInfoView()
                    MinMaxTodayView()
                    
                    Divider()
                        .background(Color.white)
                        .opacity(0.9)
                    
                    HourListView()
                    
                    Divider()
                        .background(Color.white)
                        .opacity(0.9)
                    
                    DayListView()
                    
                    Divider()
                        .background(Color.white)
                        .opacity(0.9)
                    
                    MenuView()
                }
                .frame(width: UIScreen.main.bounds.width)
                .padding(.top, UIScreen.main.bounds.height / 6)
            }
            .preferredColorScheme(.light)
        }
    }
}
    
    struct MainInfoView: View {
        var body: some View {
            Text("Bucharest")
                .font(.system(size: 38))
                .foregroundColor(.white)
                .fontWeight(.regular)
                .shadow(color: .black, radius: 1)
            Text("Mostly Cloudy")
                .font(.system(size: 19))
                .foregroundColor(.white)
                .fontWeight(.medium)
                .shadow(color: .black, radius: 1)
            
            Text("22°")
                .font(.system(size: 110))
                .foregroundColor(.white)
                .fontWeight(.thin)
                .shadow(color: .black, radius: 1)
        }
    }
    
    struct MinMaxTodayView: View {
        var body: some View {
            HStack {
                HStack(alignment: .bottom) {
                    Text("Friday")
                        .font(.system(size: 23))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 0.05)
                    
                    Text("TODAY")
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                }
                Spacer()
                HStack(alignment: .bottom, spacing: 40) {
                    Text("24")
                        .font(.system(size: 23))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                    
                    Text("8")
                        .font(.system(size: 21.5))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .opacity(0.4)
                }
                
            }
            .padding(.horizontal, 25)
            .padding(.top, 50)
        }
    }
    
    struct HourListView: View {
        var hourList = [HourTemperature(time:18, symbol: Image("clouds"), temperature: 14), HourTemperature(time: 19, symbol: Image("clouds"), temperature: 14), HourTemperature(time: 20, symbol: Image(systemName: "sunset.fill"), temperature: 14), HourTemperature(time: 21, symbol: Image("clouds"), temperature: 14), HourTemperature(time: 22, symbol: Image("clouds"), temperature: 14), HourTemperature(time: 23, symbol: Image("clouds"), temperature: 14), HourTemperature(time: 0, symbol: Image("clouds-moon"), temperature: 14), HourTemperature(time: 1, symbol: Image("sun"), temperature: 14), HourTemperature(time: 2, symbol: Image("clouds-rain"), temperature: 14)]
        
        var body: some View {
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 28) {
                        ForEach(0 ..< hourList.count){ idx in
                            CellHourView(hourCell: hourList[idx])
                        }
                    }
                    .padding(.horizontal, 25)
                }
            }
            .frame(width:UIScreen.main.bounds.width, height: 115)
            //.background(Color.red)
            
            
        }
    }
    
    struct HourTemperature {
        let time: Int
        let symbol: Image
        let temperature: Int
    }
    
    struct CellHourView: View {
        let hourCell: HourTemperature
        
        var body: some View {
            VStack(spacing: 18) {
                Text(hourCell.time >= 0 && hourCell.time < 10 ? "\(0)\(String(hourCell.time))" : String(hourCell.time))
                    .font(.system(size: 19))
                    .foregroundColor(.white)
                hourCell.symbol
                    .renderingMode(.original)
                    .resizable()
                    .foregroundColor(.yellow)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                Text("\(hourCell.temperature)°")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                
            }
        }
    }
    
    struct DayListView: View {
        let dayList = [DayTemperature(day: "Saturday", symbol: Image("clouds-sun"), maxTemperature: 24, minTemperature: 9), DayTemperature(day: "Sunday", symbol: Image("sun"), maxTemperature: 27, minTemperature: 10), DayTemperature(day: "Monday", symbol: Image("clouds-sun"), maxTemperature: 25, minTemperature: 13), DayTemperature(day: "Tuesday", symbol: Image(systemName: "cloud.rain.fill"), maxTemperature: 19, minTemperature: 12), DayTemperature(day: "Wednesday", symbol: Image("clouds"), maxTemperature: 17, minTemperature: 11), DayTemperature(day: "Thursday", symbol: Image("clouds-sun"), maxTemperature: 19, minTemperature: 9), DayTemperature(day: "Friday", symbol: Image("clouds-sun"), maxTemperature: 19, minTemperature: 8)]
        
        var body: some View {
            HStack {
                VStack(spacing: 8.5) {
                    ForEach(0 ..< dayList.count){ idx in
                        CellDayView(dayCell: dayList[idx])
                    }
                }
            }
            .padding(.horizontal, 25)
        }
    }
    
    struct DayTemperature {
        let day: String
        let symbol: Image
        let maxTemperature: Int
        let minTemperature: Int
    }
    
    struct CellDayView: View {
        let dayCell: DayTemperature
        
        var body: some View {
            HStack {
                Text(dayCell.day)
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .leading)
                
                Spacer()
                
                dayCell.symbol
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                
                Spacer()
                
                HStack{
                    Text("\(dayCell.maxTemperature)")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .frame(width: UIScreen.main.bounds.width / 9, alignment: .trailing)
                    
                    Spacer()
                    
                    Text("\(dayCell.minTemperature)")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .fontWeight(.regular)
                        .opacity(0.3)
                        .frame(width: UIScreen.main.bounds.width / 9, alignment: .trailing)
                }
                .frame(width: UIScreen.main.bounds.width / 4.5)
            }
        }
    }
    
    struct MenuView: View {
        
        var body: some View {
            HStack {
                Image("weather-channel")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                    .background(Color.white)
                    .opacity(0.4)
                
                Spacer()
                
                HStack(spacing: 5.5) {
                    ForEach(0 ..< 19) {idx in
                        Circle()
                            .frame(width: 6, height: 6)
                            .foregroundColor(.white)
                            .opacity(idx == 0 ? 1 : 0.4)
                    }
                }
                
                Spacer()
                
                Image("more")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 19, height: 19)
                    .foregroundColor(.white)
                    .opacity(0.6)
            }
            .padding(.horizontal, 20)
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            CellDayView(dayCell: DayTemperature(day: "Saturday", symbol: Image("clouds-rain"), maxTemperature: 24, minTemperature: 9))
        }
    }
