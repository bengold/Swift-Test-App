//
//  ContentView.swift
//  Test
//
//  Created by Ben Gold on 6/10/25.
//

import SwiftUI
import PhotosUI
import MapKit
import Charts
import AVKit
import UniformTypeIdentifiers
import Combine

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Section("Basic Elements") {
                    NavigationLink("Text & Typography", destination: TextElementsView())
                    NavigationLink("Controls", destination: ControlsView())
                    NavigationLink("Containers", destination: ContainersView())
                    NavigationLink("Layout & Grid", destination: LayoutView())
                    NavigationLink("Navigation", destination: NavigationElementsView())
                }
                
                Section("Collections") {
                    NavigationLink("Lists & Tables", destination: ListsAndGridsView())
                    NavigationLink("Forms & Input", destination: FormsView())
                }
                
                Section("Visual") {
                    NavigationLink("Graphics & Shapes", destination: GraphicsView())
                    NavigationLink("Media & Documents", destination: MediaView())
                    NavigationLink("Modifiers & Styling", destination: ModifiersView())
                }
                
                Section("Interaction") {
                    NavigationLink("Gestures", destination: GesturesView())
                    NavigationLink("Animation & Transitions", destination: AnimationView())
                    NavigationLink("Drag & Drop", destination: DragDropView())
                }
                
                Section("System") {
                    NavigationLink("Alerts & Presentations", destination: AlertsView())
                    NavigationLink("Data Flow", destination: DataFlowView())
                    NavigationLink("Accessibility", destination: AccessibilityView())
                    NavigationLink("Platform Integration", destination: PlatformView())
                }
            }
            .navigationTitle("SwiftUI Showcase")
        } detail: {
            Text("Select a category")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Text Elements
struct TextElementsView: View {
    @State private var customText = "Editable text"
    @State private var textEditorContent = "Multi-line text editor\nSupports multiple lines\nAnd scrolling"
    @State private var selectableText = "This text is selectable - try selecting it!"
    
    var attributedText: AttributedString {
        var result = AttributedString("Attributed String Example")
        if let range1 = result.range(of: "Attributed") {
            result[range1].foregroundColor = .red
            result[range1].font = .system(size: 20, weight: .bold)
        }
        if let range2 = result.range(of: "String") {
            result[range2].foregroundColor = .green
            result[range2].underlineStyle = .single
        }
        if let range3 = result.range(of: "Example") {
            result[range3].foregroundColor = .blue
            result[range3].backgroundColor = .yellow.opacity(0.3)
        }
        return result
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                GroupBox("Basic Text") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Plain Text")
                        
                        Text("Styled Text")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        Text("Custom Font")
                            .font(.custom("Helvetica", size: 18))
                        
                        Text("Monospaced Digits: 1234567890")
                            .monospacedDigit()
                        
                        Text("uppercase text")
                            .textCase(.uppercase)
                        
                        Text("Text with tracking")
                            .tracking(5)
                        
                        Text("Text with kerning")
                            .kerning(3)
                        
                        Text("Baseline Offset")
                            .baselineOffset(10)
                            .background(Color.gray.opacity(0.2))
                    }
                }
                
                GroupBox("Text Selection") {
                    VStack(alignment: .leading) {
                        Text(selectableText)
                            .textSelection(.enabled)
                        
                        Text("This text is NOT selectable")
                            .textSelection(.disabled)
                            .foregroundStyle(.secondary)
                    }
                }
                
                GroupBox("Attributed & Markdown") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(attributedText)
                        
                        Text("**Bold**, *Italic*, ***Both***, ~~Strikethrough~~, `Code`")
                        
                        Text("[Link](https://apple.com)")
                        
                        Text("Multiline text that wraps when it gets too long. This demonstrates how SwiftUI handles text wrapping automatically.")
                            .lineLimit(2...5)
                            .truncationMode(.middle)
                    }
                }
                
                GroupBox("Text Editor") {
                    TextEditor(text: $textEditorContent)
                        .frame(height: 100)
                        .border(Color.gray.opacity(0.3))
                        .scrollContentBackground(.hidden)
                        .background(Color.gray.opacity(0.1))
                }
                
                GroupBox("Date & Time Formatting") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(Date(), style: .date)
                        Text(Date(), style: .time)
                        Text(Date(), style: .relative)
                        Text(Date(), style: .offset)
                        Text(Date(), style: .timer)
                        
                        Text(Date(), format: .dateTime.year().month().day())
                        Text(Date(), format: .dateTime.hour().minute())
                        Text(123.45, format: .currency(code: "USD").presentation(.narrow))
                    }
                }
                
                GroupBox("Labels") {
                    VStack(alignment: .leading, spacing: 10) {
                        Label("Label with Icon", systemImage: "star.fill")
                        
                        Label("Custom Label", systemImage: "heart.fill")
                            .labelStyle(.titleAndIcon)
                        
                        Label("Title Only", systemImage: "bell")
                            .labelStyle(.titleOnly)
                        
                        Label("Icon Only", systemImage: "gear")
                            .labelStyle(.iconOnly)
                        
                        LabeledContent("Key", value: "Value")
                        
                        LabeledContent("Price") {
                            Text("$99.99")
                                .foregroundStyle(.green)
                        }
                    }
                }
                
                GroupBox("Redacted") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("This text can be redacted")
                            .redacted(reason: .placeholder)
                        
                        Text("Privacy sensitive content")
                            .redacted(reason: .privacy)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Text & Typography")
    }
}

// MARK: - Controls
struct ControlsView: View {
    @State private var toggleOn = false
    @State private var sliderValue = 0.5
    @State private var stepperValue = 0
    @State private var pickerSelection = 0
    @State private var rating = 3
    @State private var isEditing = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                GroupBox("Buttons") {
                    VStack(alignment: .leading, spacing: 10) {
                        Button("Standard Button") { }
                        
                        Button(action: {}) {
                            Label("Button with Icon", systemImage: "star")
                        }
                        
                        Button("Bordered Button") { }
                            .buttonStyle(.bordered)
                        
                        Button("Prominent Button") { }
                            .buttonStyle(.borderedProminent)
                        
                        Button("Destructive Button") { }
                            .buttonStyle(.borderedProminent)
                            .tint(.red)
                        
                        Button("Plain Button") { }
                            .buttonStyle(.plain)
                        
                        EditButton()
                        
                        ShareLink(item: URL(string: "https://apple.com")!)
                        
                        ShareLink(item: "Share this text") {
                            Label("Custom Share", systemImage: "square.and.arrow.up")
                        }
                        
                        if #available(iOS 16.0, *) {
                            RenameButton()
                            
                            PasteButton(payloadType: String.self) { strings in
                                print("Pasted: \(strings)")
                            }
                        } else {
                            Button("Rename") { }
                            Button("Paste") { }
                        }
                    }
                }
                
                GroupBox("Controls") {
                    VStack(alignment: .leading, spacing: 15) {
                        Toggle("Toggle Switch", isOn: $toggleOn)
                        
                        Toggle(isOn: $toggleOn) {
                            Label("Custom Toggle", systemImage: "lightbulb")
                        }
                        .toggleStyle(.button)
                        
                        Slider(value: $sliderValue, in: 0...1) {
                            Text("Slider")
                        } minimumValueLabel: {
                            Image(systemName: "speaker")
                        } maximumValueLabel: {
                            Image(systemName: "speaker.wave.3")
                        }
                        
                        Stepper("Stepper: \(stepperValue)", value: $stepperValue, in: 0...10)
                        
                        Stepper("Custom Step", value: $stepperValue, in: 0...100, step: 5)
                    }
                }
                
                GroupBox("Pickers") {
                    VStack(alignment: .leading, spacing: 10) {
                        Picker("Segmented", selection: $pickerSelection) {
                            Text("Option 1").tag(0)
                            Text("Option 2").tag(1)
                            Text("Option 3").tag(2)
                        }
                        .pickerStyle(.segmented)
                        
                        Picker("Menu", selection: $pickerSelection) {
                            Text("Option 1").tag(0)
                            Text("Option 2").tag(1)
                            Text("Option 3").tag(2)
                        }
                        .pickerStyle(.menu)
                        
                        Picker("Wheel", selection: $pickerSelection) {
                            ForEach(0..<10) { i in
                                Text("Item \(i)").tag(i)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 100)
                        
                        Picker("Navigation Link", selection: $pickerSelection) {
                            Text("Option 1").tag(0)
                            Text("Option 2").tag(1)
                            Text("Option 3").tag(2)
                        }
                        .pickerStyle(.navigationLink)
                    }
                }
                
                GroupBox("Progress") {
                    VStack(spacing: 10) {
                        ProgressView()
                        
                        ProgressView("Loading...")
                        
                        ProgressView("Progress", value: sliderValue)
                        
                        ProgressView(value: sliderValue) {
                            Text("Downloading")
                        } currentValueLabel: {
                            Text("\(Int(sliderValue * 100))%")
                        }
                        .progressViewStyle(.circular)
                        
                        Gauge(value: sliderValue, in: 0...1) {
                            Text("Gauge")
                        } currentValueLabel: {
                            Text("\(Int(sliderValue * 100))%")
                        }
                        
                        Gauge(value: sliderValue, in: 0...1) {
                            Image(systemName: "gauge")
                        }
                        .gaugeStyle(.accessoryCircular)
                    }
                }
                
                GroupBox("Control Groups") {
                    VStack(alignment: .leading, spacing: 10) {
                        if #available(iOS 15.0, *) {
                            ControlGroup {
                                Button(action: {}) {
                                    Image(systemName: "bold")
                                }
                                Button(action: {}) {
                                    Image(systemName: "italic")
                                }
                                Button(action: {}) {
                                    Image(systemName: "underline")
                                }
                            }
                            
                            ControlGroup {
                                Button("Cut", action: {})
                                Button("Copy", action: {})
                                Button("Paste", action: {})
                            }
                            .controlGroupStyle(.navigation)
                        } else {
                            HStack {
                                Button(action: {}) {
                                    Image(systemName: "bold")
                                }
                                Button(action: {}) {
                                    Image(systemName: "italic")
                                }
                                Button(action: {}) {
                                    Image(systemName: "underline")
                                }
                            }
                            .buttonStyle(.bordered)
                            
                            HStack {
                                Button("Cut", action: {})
                                Button("Copy", action: {})
                                Button("Paste", action: {})
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }
                
                GroupBox("Rating") {
                    HStack {
                        ForEach(1...5, id: \.self) { star in
                            Image(systemName: star <= rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    rating = star
                                }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Controls")
    }
}

// MARK: - Containers
struct ContainersView: View {
    @State private var expandedGroup = true
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GroupBox("GroupBox") {
                    Text("Content inside a GroupBox")
                }
                
                GroupBox {
                    Text("GroupBox with custom label")
                        .padding()
                } label: {
                    Label("Custom Label", systemImage: "folder")
                }
                
                DisclosureGroup("DisclosureGroup", isExpanded: $expandedGroup) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Hidden content")
                        Text("More hidden content")
                        Text("Even more content")
                    }
                }
                
                Section {
                    Text("Section content")
                    Text("More section content")
                } header: {
                    Text("Section Header")
                        .font(.headline)
                } footer: {
                    Text("Section Footer")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                TabView {
                    Text("Tab 1").tabItem { Label("First", systemImage: "1.circle") }
                    Text("Tab 2").tabItem { Label("Second", systemImage: "2.circle") }
                    Text("Tab 3").tabItem { Label("Third", systemImage: "3.circle") }
                }
                .frame(height: 200)
                
                TabView {
                    ForEach(0..<5) { i in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue.opacity(0.3))
                            .overlay(Text("Page \(i + 1)"))
                            .padding()
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(height: 200)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<10) { i in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green.opacity(0.3))
                                .frame(width: 100, height: 100)
                                .overlay(Text("\(i)"))
                        }
                    }
                }
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<20) { i in
                                Text("Item \(i)")
                                    .id(i)
                                    .padding()
                                    .background(Color.orange.opacity(0.3))
                            }
                        }
                    }
                    Button("Scroll to Item 10") {
                        withAnimation {
                            proxy.scrollTo(10, anchor: .center)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Containers")
    }
}

// MARK: - Layout
struct LayoutView: View {
    let columns = [
        GridItem(.fixed(100)),
        GridItem(.flexible()),
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                GroupBox("Stack Layouts") {
                    VStack(spacing: 20) {
                        VStack {
                            Text("VStack")
                            Text("Vertical")
                            Text("Layout")
                        }
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        
                        HStack {
                            Text("HStack")
                            Text("Horizontal")
                            Text("Layout")
                        }
                        .padding()
                        .background(Color.green.opacity(0.2))
                        
                        ZStack {
                            Circle()
                                .fill(Color.yellow.opacity(0.3))
                                .frame(width: 100, height: 100)
                            Text("ZStack")
                        }
                    }
                }
                
                GroupBox("Grid Layout") {
                    Grid(alignment: .center, horizontalSpacing: 20, verticalSpacing: 20) {
                        GridRow {
                            Text("Row 1, Col 1")
                                .gridCellColumns(2)
                            Text("Row 1, Col 3")
                        }
                        
                        GridRow {
                            Text("Row 2, Col 1")
                            Color.blue
                                .frame(width: 50, height: 50)
                            Text("Row 2, Col 3")
                        }
                        
                        Divider()
                            .gridCellUnsizedAxes(.horizontal)
                        
                        GridRow {
                            Text("Row 3")
                                .gridColumnAlignment(.leading)
                            Text("Center")
                                .gridColumnAlignment(.center)
                            Text("Trailing")
                                .gridColumnAlignment(.trailing)
                        }
                    }
                    .padding()
                }
                
                GroupBox("Lazy Grids") {
                    VStack(spacing: 20) {
                        Text("LazyVGrid")
                            .font(.headline)
                        
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(0..<12) { i in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.purple.opacity(0.3))
                                    .frame(height: 50)
                                    .overlay(Text("\(i)"))
                            }
                        }
                        
                        Text("LazyHGrid")
                            .font(.headline)
                        
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: [GridItem(.fixed(50)), GridItem(.fixed(50))]) {
                                ForEach(0..<20) { i in
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.orange.opacity(0.3))
                                        .frame(width: 80)
                                        .overlay(Text("\(i)"))
                                }
                            }
                        }
                        .frame(height: 120)
                    }
                }
                
                GroupBox("Layout Priority & Spacing") {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Leading")
                                .layoutPriority(1)
                            Spacer()
                            Text("Trailing")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        
                        HStack {
                            Text("Fixed")
                                .frame(width: 100)
                                .background(Color.red.opacity(0.2))
                            
                            Text("Flexible")
                                .frame(maxWidth: .infinity)
                                .background(Color.green.opacity(0.2))
                            
                            Text("Fixed")
                                .frame(width: 100)
                                .background(Color.blue.opacity(0.2))
                        }
                    }
                }
                
                GroupBox("GeometryReader") {
                    GeometryReader { geometry in
                        VStack {
                            Text("Width: \(Int(geometry.size.width))")
                            Text("Height: \(Int(geometry.size.height))")
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(Color.orange.opacity(0.3))
                    }
                    .frame(height: 100)
                }
                
                GroupBox("ViewThatFits") {
                    ViewThatFits {
                        Text("This is a very long text that might not fit in the available space")
                            .fixedSize()
                        Text("Shorter alternative text")
                        Text("Short")
                    }
                    .frame(width: 150)
                    .padding()
                    .background(Color.blue.opacity(0.3))
                }
                
                GroupBox("Dividers") {
                    VStack {
                        Text("Above Divider")
                        Divider()
                        Text("Below Divider")
                        Divider()
                            .frame(height: 2)
                            .background(Color.blue)
                        HStack {
                            Text("Left")
                            Divider()
                            Text("Right")
                        }
                        .frame(height: 50)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Layout & Grid")
    }
}

// MARK: - Navigation
struct NavigationElementsView: View {
    @State private var path = NavigationPath()
    @State private var searchText = ""
    @State private var selectedItem: String?
    
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink("Push View") {
                Text("Pushed View")
                    .navigationTitle("Detail")
                    .navigationBarTitleDisplayMode(.inline)
            }
            
            NavigationLink(destination: Text("Destination View")) {
                HStack {
                    Image(systemName: "arrow.right.circle")
                    Text("Custom Navigation Link")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            NavigationLink("Value-based Navigation", value: "Some Value")
            
            List(["Item 1", "Item 2", "Item 3"], id: \.self, selection: $selectedItem) { item in
                NavigationLink(item, value: item)
            }
            .frame(height: 150)
            
            Menu("Menu") {
                Button("Option 1", action: {})
                Button("Option 2", action: {})
                Divider()
                Menu("Submenu") {
                    Button("Suboption 1", action: {})
                    Button("Suboption 2", action: {})
                }
                Divider()
                Button("Delete", role: .destructive, action: {})
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Navigation")
        .navigationDestination(for: String.self) { value in
            Text("Navigated to: \(value)")
        }
        .searchable(text: $searchText, prompt: "Search...")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button("Edit", action: {})
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
                Button("Bottom Action", action: {})
            }
        }
    }
}

// MARK: - Lists and Grids
struct ListsAndGridsView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    @State private var selectedItems = Set<String>()
    @State private var editMode: EditMode = .inactive
    @State private var searchText = ""
    
    let colors: [Color] = [.red, .green, .blue, .orange, .purple]
    
    struct TableItem: Identifiable {
        let id = UUID()
        let name: String
        let value: Int
        let date: Date
    }
    
    let tableItems = [
        TableItem(name: "Item A", value: 100, date: Date()),
        TableItem(name: "Item B", value: 200, date: Date().addingTimeInterval(-86400)),
        TableItem(name: "Item C", value: 150, date: Date().addingTimeInterval(-172800))
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GroupBox("Basic List") {
                    List {
                        Text("Simple List Item")
                        
                        ForEach(items, id: \.self) { item in
                            Text(item)
                        }
                        
                        Section("Section") {
                            Text("Section Item 1")
                            Text("Section Item 2")
                        }
                    }
                    .frame(height: 300)
                    .listStyle(.plain)
                }
                
                GroupBox("Editable List") {
                    VStack {
                        EditButton()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        List {
                            ForEach(items, id: \.self) { item in
                                Text(item)
                            }
                            .onDelete { indexSet in
                                items.remove(atOffsets: indexSet)
                            }
                            .onMove { source, destination in
                                items.move(fromOffsets: source, toOffset: destination)
                            }
                        }
                        .frame(height: 200)
                        .environment(\.editMode, $editMode)
                    }
                }
                
                GroupBox("List with Swipe Actions") {
                    List {
                        ForEach(items, id: \.self) { item in
                            Text(item)
                                .swipeActions(edge: .trailing) {
                                    Button("Delete", role: .destructive) {
                                        items.removeAll { $0 == item }
                                    }
                                    Button("Flag") { }
                                        .tint(.orange)
                                }
                                .swipeActions(edge: .leading) {
                                    Button("Pin") { }
                                        .tint(.yellow)
                                }
                        }
                    }
                    .frame(height: 200)
                }
                
                GroupBox("List Styles") {
                    VStack(spacing: 10) {
                        List(0..<3) { i in
                            Text("Inset Style \(i)")
                        }
                        .listStyle(.inset)
                        .frame(height: 150)
                        
                        List(0..<3) { i in
                            Text("Grouped Style \(i)")
                        }
                        .listStyle(.insetGrouped)
                        .frame(height: 150)
                    }
                }
                
                GroupBox("Table (macOS/iPadOS)") {
                    if #available(iOS 16.0, *) {
                        Table(tableItems) {
                            TableColumn("Name", value: \.name)
                            TableColumn("Value") { item in
                                Text("\(item.value)")
                            }
                            TableColumn("Date") { item in
                                Text(item.date, style: .date)
                            }
                        }
                        .frame(height: 200)
                    }
                }
                
                GroupBox("Outline Group") {
                    OutlineGroup(sampleData, children: \.children) { item in
                        Label(item.name, systemImage: item.icon)
                    }
                }
                
                GroupBox("Grids") {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                        ForEach(0..<20) { i in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(colors[i % colors.count])
                                .frame(height: 80)
                                .overlay(Text("\(i)").foregroundColor(.white))
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Lists & Tables")
        .searchable(text: $searchText) {
            ForEach(items.filter { searchText.isEmpty || $0.contains(searchText) }, id: \.self) { item in
                Text(item).searchCompletion(item)
            }
        }
        .refreshable {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            items.append("New Item \(items.count + 1)")
        }
    }
}

// Outline data structure
struct FileItem: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let children: [FileItem]?
}

let sampleData = [
    FileItem(name: "Documents", icon: "folder", children: [
        FileItem(name: "Resume.pdf", icon: "doc", children: nil),
        FileItem(name: "Cover Letter.docx", icon: "doc", children: nil)
    ]),
    FileItem(name: "Photos", icon: "folder", children: [
        FileItem(name: "Vacation", icon: "folder", children: [
            FileItem(name: "Beach.jpg", icon: "photo", children: nil),
            FileItem(name: "Sunset.jpg", icon: "photo", children: nil)
        ])
    ])
]

// MARK: - Forms
struct FormsView: View {
    @State private var text = ""
    @State private var secureText = ""
    @State private var multilineText = "This is a multi-line\ntext field"
    @State private var numberText = ""
    @State private var date = Date()
    @State private var color = Color.blue
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedToggle = false
    @State private var selectedOption = 0
    
    @FocusState private var focusedField: Field?
    
    enum Field: Hashable {
        case username
        case password
        case email
    }
    
    var body: some View {
        Form {
            Section("Text Input") {
                TextField("Username", text: $text)
                    .focused($focusedField, equals: .username)
                    .textContentType(.username)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $secureText)
                    .focused($focusedField, equals: .password)
                    .textContentType(.password)
                
                TextField("Email", text: $text)
                    .focused($focusedField, equals: .email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = .password
                    }
                
                TextField("Number only", text: $numberText)
                    .keyboardType(.numberPad)
                
                TextField("Multiline Text", text: $multilineText, axis: .vertical)
                    .lineLimit(3...6)
            }
            
            Section("Pickers") {
                DatePicker("Date", selection: $date)
                
                DatePicker("Date (Compact)", selection: $date)
                    .datePickerStyle(.compact)
                
                DatePicker("Date (Wheel)", selection: $date)
                    .datePickerStyle(.wheel)
                
                DatePicker("Date Only", selection: $date, displayedComponents: .date)
                
                DatePicker("Time Only", selection: $date, displayedComponents: .hourAndMinute)
                
                ColorPicker("Color", selection: $color)
                
                PhotosPicker("Select Photo", selection: $selectedPhoto, matching: .images)
            }
            
            Section("Form Controls") {
                Toggle("Enable Feature", isOn: $selectedToggle)
                
                Picker("Options", selection: $selectedOption) {
                    Text("Option 1").tag(0)
                    Text("Option 2").tag(1)
                    Text("Option 3").tag(2)
                }
                
                Stepper("Value: \(selectedOption)", value: $selectedOption, in: 0...10)
            }
            
            Section("Actions") {
                Button("Submit") {
                    focusedField = nil
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle("Forms & Input")
        .formStyle(.grouped)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Previous") {
                    switch focusedField {
                    case .password: focusedField = .username
                    case .email: focusedField = .password
                    default: break
                    }
                }
                
                Button("Next") {
                    switch focusedField {
                    case .username: focusedField = .password
                    case .password: focusedField = .email
                    default: break
                    }
                }
                
                Spacer()
                
                Button("Done") {
                    focusedField = nil
                }
            }
        }
    }
}

// MARK: - Graphics
struct GraphicsView: View {
    @State private var player = AVPlayer(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
    @State private var gradientStartPoint = UnitPoint.topLeading
    @State private var gradientEndPoint = UnitPoint.bottomTrailing
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GroupBox("Basic Shapes") {
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 60, height: 60)
                            
                            Ellipse()
                                .fill(Color.green)
                                .frame(width: 80, height: 60)
                            
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 60, height: 60)
                        }
                        
                        HStack(spacing: 20) {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.orange)
                                .frame(width: 80, height: 60)
                            
                            UnevenRoundedRectangle(
                                topLeadingRadius: 30,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 30,
                                topTrailingRadius: 0
                            )
                            .fill(Color.purple)
                            .frame(width: 80, height: 60)
                            
                            Capsule()
                                .fill(Color.pink)
                                .frame(width: 80, height: 40)
                        }
                        
                        ContainerRelativeShape()
                            .fill(Color.mint)
                            .frame(width: 100, height: 60)
                    }
                    .padding()
                }
                
                GroupBox("Gradients") {
                    VStack(spacing: 20) {
                        Rectangle()
                            .fill(LinearGradient(
                                colors: [.red, .yellow, .green, .blue, .purple],
                                startPoint: gradientStartPoint,
                                endPoint: gradientEndPoint
                            ))
                            .frame(height: 60)
                        
                        Circle()
                            .fill(RadialGradient(
                                colors: [.white, .blue, .black],
                                center: .center,
                                startRadius: 5,
                                endRadius: 50
                            ))
                            .frame(width: 100, height: 100)
                        
                        Circle()
                            .fill(AngularGradient(
                                colors: [.red, .yellow, .green, .cyan, .blue, .purple, .red],
                                center: .center
                            ))
                            .frame(width: 100, height: 100)
                        
                        Rectangle()
                            .fill(.conicGradient(
                                colors: [.red, .blue],
                                center: .center
                            ))
                            .frame(height: 60)
                    }
                }
                
                GroupBox("Strokes & Borders") {
                    VStack(spacing: 20) {
                        Circle()
                            .stroke(Color.blue, lineWidth: 4)
                            .frame(width: 80, height: 80)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.red, style: StrokeStyle(
                                lineWidth: 4,
                                lineCap: .round,
                                lineJoin: .round,
                                dash: [10, 5]
                            ))
                            .frame(height: 60)
                        
                        Rectangle()
                            .strokeBorder(
                                LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing),
                                lineWidth: 4
                            )
                            .frame(height: 60)
                    }
                }
                
                GroupBox("Custom Path") {
                    Path { path in
                        path.move(to: CGPoint(x: 50, y: 0))
                        path.addLine(to: CGPoint(x: 100, y: 100))
                        path.addLine(to: CGPoint(x: 0, y: 100))
                        path.closeSubpath()
                    }
                    .fill(Color.orange)
                    .frame(width: 100, height: 100)
                    
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 50))
                        path.addCurve(
                            to: CGPoint(x: 100, y: 50),
                            control1: CGPoint(x: 25, y: 0),
                            control2: CGPoint(x: 75, y: 100)
                        )
                    }
                    .stroke(Color.purple, lineWidth: 3)
                    .frame(width: 100, height: 100)
                }
                
                GroupBox("SF Symbols") {
                    VStack(spacing: 20) {
                        HStack(spacing: 20) {
                            Image(systemName: "star.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.yellow)
                            
                            Image(systemName: "heart.fill")
                                .font(.system(size: 50))
                                .symbolRenderingMode(.multicolor)
                            
                            Image(systemName: "cloud.sun.rain.fill")
                                .font(.system(size: 50))
                                .symbolRenderingMode(.hierarchical)
                                .foregroundColor(.blue)
                        }
                        
                        HStack(spacing: 20) {
                            Image(systemName: "gauge.with.dots.needle.67percent")
                                .font(.system(size: 50))
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.blue, .gray)
                            
                            Image(systemName: "folder.fill.badge.plus")
                                .font(.system(size: 50))
                                .symbolVariant(.fill)
                                .foregroundStyle(.blue, .green)
                        }
                    }
                }
                
                GroupBox("Images") {
                    VStack(spacing: 20) {
                        AsyncImage(url: URL(string: "https://picsum.photos/200")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 200, height: 200)
                        
                        AsyncImage(url: URL(string: "https://picsum.photos/300")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .clipped()
                                    .cornerRadius(20)
                            case .failure(_):
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                }
                
                GroupBox("Charts") {
                    Chart {
                        BarMark(x: .value("Category", "A"), y: .value("Value", 5))
                            .foregroundStyle(.red)
                        BarMark(x: .value("Category", "B"), y: .value("Value", 3))
                            .foregroundStyle(.green)
                        BarMark(x: .value("Category", "C"), y: .value("Value", 8))
                            .foregroundStyle(.blue)
                        
                        RuleMark(y: .value("Average", 5.3))
                            .foregroundStyle(.gray)
                            .lineStyle(StrokeStyle(dash: [5, 3]))
                    }
                    .frame(height: 200)
                    .chartYAxis {
                        AxisMarks(position: .leading)
                    }
                }
                
                GroupBox("Canvas") {
                    Canvas { context, size in
                        context.fill(
                            Path(ellipseIn: CGRect(origin: .zero, size: size)),
                            with: .linearGradient(
                                Gradient(colors: [.red, .blue]),
                                startPoint: .zero,
                                endPoint: CGPoint(x: size.width, y: size.height)
                            )
                        )
                        
                        context.draw(Text("Canvas Drawing"), at: CGPoint(x: size.width/2, y: size.height/2))
                    }
                    .frame(height: 100)
                    .background(Color.gray.opacity(0.1))
                }
                
                GroupBox("Video Player") {
                    VideoPlayer(player: player)
                        .frame(height: 200)
                        .onAppear {
                            player.play()
                        }
                }
            }
            .padding()
        }
        .navigationTitle("Graphics & Shapes")
    }
}

// MARK: - Media & Documents
struct MediaView: View {
    @State private var showingDocumentPicker = false
    @State private var showingFilePicker = false
    @State private var showingCamera = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GroupBox("Map") {
                    Map()
                        .frame(height: 300)
                        .cornerRadius(10)
                }
                
                GroupBox("Document Interaction") {
                    VStack(spacing: 10) {
                        Button("Open Document Picker") {
                            showingDocumentPicker = true
                        }
                        .buttonStyle(.bordered)
                        
                        Button("Import File") {
                            showingFilePicker = true
                        }
                        .buttonStyle(.bordered)
                        
                        ShareLink(
                            item: URL(string: "https://apple.com")!,
                            subject: Text("Check this out"),
                            message: Text("I found this interesting")
                        )
                    }
                }
                
                GroupBox("Camera") {
                    VStack {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                        }
                        
                        Button("Open Camera") {
                            showingCamera = true
                        }
                        .buttonStyle(.bordered)
                    }
                }
                
                GroupBox("Quick Look") {
                    Text("Quick Look preview would appear here")
                        .foregroundStyle(.secondary)
                        .frame(height: 100)
                }
            }
            .padding()
        }
        .navigationTitle("Media & Documents")
        .fileImporter(
            isPresented: $showingFilePicker,
            allowedContentTypes: [.text, .pdf],
            allowsMultipleSelection: false
        ) { result in
            // Handle file import
        }
    }
}

// MARK: - Gestures
struct GesturesView: View {
    @State private var offset = CGSize.zero
    @State private var lastOffset = CGSize.zero
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    @State private var rotation: Angle = .zero
    @State private var tapCount = 0
    @State private var isHovering = false
    @State private var longPressCompleted = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                GroupBox("Tap Gestures") {
                    VStack(spacing: 20) {
                        Text("\(tapCount)")
                            .foregroundStyle(Color.red)
                            .font(.system(size: 50, weight: .bold))
                        
                        Button("Tap Me") {
                            tapCount += 1
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Text("Double Tap Me")
                            .padding()
                            .background(Color.green.opacity(0.3))
                            .onTapGesture(count: 2) {
                                tapCount += 2
                            }
                        
                        Text("Triple Tap")
                            .padding()
                            .background(Color.blue.opacity(0.3))
                            .onTapGesture(count: 3) {
                                tapCount = 0
                            }
                    }
                }
                
                GroupBox("Long Press") {
                    Text(longPressCompleted ? "Completed!" : "Long Press Me")
                        .padding()
                        .background(longPressCompleted ? Color.green : Color.orange.opacity(0.3))
                        .onLongPressGesture(minimumDuration: 2.0) {
                            longPressCompleted = true
                        } onPressingChanged: { pressing in
                            if !pressing {
                                longPressCompleted = false
                            }
                        }
                }
                
                GroupBox("Drag Gesture") {
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 100, height: 100)
                        .offset(offset)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    offset = CGSize(
                                        width: lastOffset.width + value.translation.width,
                                        height: lastOffset.height + value.translation.height
                                    )
                                }
                                .onEnded { _ in
                                    lastOffset = offset
                                }
                        )
                        .animation(.spring(), value: offset)
                    
                    Text("Drag the circle")
                        .foregroundStyle(.secondary)
                }
                .frame(height: 200)
                
                GroupBox("Magnification & Rotation") {
                    Image(systemName: "star.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.yellow)
                        .scaleEffect(scale)
                        .rotationEffect(rotation)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    scale = lastScale * value
                                }
                                .onEnded { _ in
                                    lastScale = scale
                                }
                                .simultaneously(with:
                                    RotationGesture()
                                        .onChanged { value in
                                            rotation = value
                                        }
                                )
                        )
                        .animation(.spring(), value: scale)
                        .animation(.spring(), value: rotation)
                    
                    Text("Pinch to scale, rotate with two fingers")
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                
                GroupBox("Hover Effect") {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(isHovering ? Color.blue : Color.gray)
                        .frame(height: 100)
                        .scaleEffect(isHovering ? 1.05 : 1.0)
                        .animation(.easeInOut, value: isHovering)
                        .onHover { hovering in
                            isHovering = hovering
                        }
                        .overlay(
                            Text(isHovering ? "Hovering!" : "Hover over me")
                                .foregroundColor(.white)
                        )
                }
                
                GroupBox("Simultaneous Gestures") {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 100, height: 100)
                        .offset(offset)
                        .scaleEffect(scale)
                        .gesture(
                            SimultaneousGesture(
                                DragGesture()
                                    .onChanged { value in
                                        offset = value.translation
                                    },
                                MagnificationGesture()
                                    .onChanged { value in
                                        scale = value
                                    }
                            )
                        )
                    
                    Text("Drag and pinch simultaneously")
                        .foregroundStyle(.secondary)
                }
            }
            .buttonStyle(.bordered)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
        }
        .navigationTitle("Gestures")
    }
}

// MARK: - Animation
struct AnimationView: View {
    @State private var isAnimating = false
    @State private var progress: CGFloat = 0
    @State private var symbolEffect = false
    @State private var phase = 0.0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                GroupBox("Basic Animations") {
                    VStack(spacing: 20) {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 50, height: 50)
                            .offset(x: isAnimating ? 100 : -100)
                            .animation(.easeInOut(duration: 1), value: isAnimating)
                        
                        Circle()
                            .fill(Color.green)
                            .frame(width: 50, height: 50)
                            .offset(x: isAnimating ? 100 : -100)
                            .animation(.spring(response: 0.5, dampingFraction: 0.6), value: isAnimating)
                        
                        Circle()
                            .fill(Color.red)
                            .frame(width: 50, height: 50)
                            .offset(x: isAnimating ? 100 : -100)
                            .animation(.linear(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
                        
                        Button("Toggle Animation") {
                            isAnimating.toggle()
                        }
                    }
                }
                
                GroupBox("Animation Types") {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Smooth")
                            Spacer()
                            Circle()
                                .fill(Color.purple)
                                .frame(width: 30, height: 30)
                                .offset(x: isAnimating ? 0 : -100)
                                .animation(
                                    {
                                        if #available(iOS 17.0, *) {
                                            return .smooth(duration: 1)
                                        } else {
                                            return .easeInOut(duration: 1)
                                        }
                                    }(), value: isAnimating
                                )
                        }
                        
                        HStack {
                            Text("Snappy")
                            Spacer()
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 30, height: 30)
                                .offset(x: isAnimating ? 0 : -100)
                                .animation(
                                    {
                                        if #available(iOS 17.0, *) {
                                            return .snappy(duration: 1)
                                        } else {
                                            return .spring(response: 0.5, dampingFraction: 0.8)
                                        }
                                    }(), value: isAnimating
                                )
                        }
                        
                        HStack {
                            Text("Bouncy")
                            Spacer()
                            Circle()
                                .fill(Color.pink)
                                .frame(width: 30, height: 30)
                                .offset(x: isAnimating ? 0 : -100)
                                .animation(
                                    {
                                        if #available(iOS 17.0, *) {
                                            return .bouncy(duration: 1)
                                        } else {
                                            return .spring(response: 0.4, dampingFraction: 0.6)
                                        }
                                    }(), value: isAnimating
                                )
                        }
                    }
                }
                
                GroupBox("Transitions") {
                    VStack {
                        if isAnimating {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.blue)
                                .frame(height: 100)
                                .transition(.asymmetric(
                                    insertion: .move(edge: .leading).combined(with: .opacity),
                                    removal: .move(edge: .trailing).combined(with: .opacity)
                                ))
                        }
                        
                        Button("Toggle View") {
                            withAnimation {
                                isAnimating.toggle()
                            }
                        }
                    }
                }
                
                GroupBox("Symbol Effects") {
                    VStack(spacing: 20) {
                        if #available(iOS 17.0, *) {
                            HStack(spacing: 30) {
                                Image(systemName: "bell.fill")
                                    .font(.largeTitle)
                                    .symbolEffect(.bounce, value: symbolEffect)
                                
                                Image(systemName: "heart.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.red)
                                    .symbolEffect(.pulse, value: symbolEffect)
                                
                                Image(systemName: "star.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.yellow)
                                    .symbolEffect(.variableColor, value: symbolEffect)
                            }
                            
                            Button("Trigger Effects") {
                                symbolEffect.toggle()
                            }
                        } else {
                            HStack(spacing: 30) {
                                Image(systemName: "bell.fill")
                                    .font(.largeTitle)
                                    .scaleEffect(symbolEffect ? 1.2 : 1.0)
                                    .animation(.bouncy, value: symbolEffect)
                                
                                Image(systemName: "heart.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.red)
                                    .opacity(symbolEffect ? 0.5 : 1.0)
                                    .animation(.easeInOut(duration: 0.5), value: symbolEffect)
                                
                                Image(systemName: "star.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.yellow)
                                    .rotationEffect(.degrees(symbolEffect ? 180 : 0))
                                    .animation(.spring(), value: symbolEffect)
                            }
                            
                            Button("Trigger Effects") {
                                symbolEffect.toggle()
                            }
                        }
                    }
                }
                
                GroupBox("Phase Animator") {
                    if #available(iOS 17.0, *) {
                        PhaseAnimator([0, 1, 2, 3]) { phase in
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.blue)
                                .frame(width: 50, height: 50)
                                .scaleEffect(phase == 0 ? 1 : 1.2)
                                .offset(x: CGFloat(phase * 30))
                        }
                    } else {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .frame(width: 50, height: 50)
                            .scaleEffect(isAnimating ? 1.2 : 1.0)
                            .offset(x: isAnimating ? 90 : 0)
                            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isAnimating)
                    }
                }
                
                GroupBox("Matched Geometry") {
                    // Would require namespace implementation
                    Text("Matched Geometry Effect")
                        .foregroundStyle(.secondary)
                }
                
                GroupBox("Content Transition") {
                    if #available(iOS 17.0, *) {
                        Text("\(Int(progress * 100))")
                            .font(.largeTitle.monospacedDigit())
                            .contentTransition(.numericText())
                            .animation(.smooth, value: progress)
                    } else {
                        Text("\(Int(progress * 100))")
                            .font(.largeTitle.monospacedDigit())
                            .animation(.smooth, value: progress)
                    }
                    
                    Slider(value: $progress)
                        .padding()
                }
            }
            .padding()
        }
        .navigationTitle("Animation & Transitions")
        .onAppear {
            isAnimating = true
        }
    }
}

// MARK: - Drag & Drop
struct DraggableItem: Identifiable {
    let id = UUID()
    let colorName: String
    let name: String
    
    var color: Color {
        switch colorName {
        case "red": return .red
        case "green": return .green
        case "blue": return .blue
        case "orange": return .orange
        case "purple": return .purple
        default: return .gray
        }
    }
}

struct DragDropView: View {
    @State private var sourceItems = [
        DraggableItem(colorName: "red", name: "Red"),
        DraggableItem(colorName: "green", name: "Green"),
        DraggableItem(colorName: "blue", name: "Blue"),
        DraggableItem(colorName: "orange", name: "Orange"),
        DraggableItem(colorName: "purple", name: "Purple")
    ]
    @State private var droppedItems: [DraggableItem] = []
    
    var body: some View {
        VStack(spacing: 40) {
            GroupBox("Drag Source") {
                HStack(spacing: 20) {
                    ForEach(sourceItems) { item in
                        Circle()
                            .fill(item.color)
                            .frame(width: 50, height: 50)
                            .draggable(item.name) {
                                Circle()
                                    .fill(item.color)
                                    .frame(width: 50, height: 50)
                                    .opacity(0.5)
                            }
                    }
                }
                .padding()
            }
            
            GroupBox("Drop Target") {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 150)
                    
                    if droppedItems.isEmpty {
                        Text("Drop colors here")
                            .foregroundStyle(.secondary)
                    } else {
                        HStack {
                            ForEach(droppedItems) { item in
                                VStack {
                                    Circle()
                                        .fill(item.color)
                                        .frame(width: 40, height: 40)
                                    Text(item.name)
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
                .dropDestination(for: String.self) { items, location in
                    for itemName in items {
                        if let sourceItem = sourceItems.first(where: { $0.name == itemName }) {
                            droppedItems.append(sourceItem)
                        }
                    }
                    return true
                }
            }
            
            Button("Clear") {
                droppedItems.removeAll()
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Drag & Drop")
    }
}

// MARK: - Modifiers
struct ModifiersView: View {
    @State private var showingShadow = true
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GroupBox("Visual Effects") {
                    VStack(spacing: 20) {
                        Text("Shadow")
                            .padding()
                            .background(Color.white)
                            .shadow(color: .black.opacity(0.3), radius: showingShadow ? 5 : 0, x: 0, y: 2)
                        
                        Text("Multiple Shadows")
                            .padding()
                            .background(Color.white)
                            .shadow(color: .blue, radius: 10)
                            .shadow(color: .red, radius: 20)
                        
                        Text("Border")
                            .padding()
                            .border(Color.blue, width: 2)
                        
                        Text("Overlay Border")
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 2)
                            )
                    }
                }
                
                GroupBox("Clipping & Masking") {
                    VStack(spacing: 20) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 100))
                            .foregroundStyle(
                                LinearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom)
                            )
                            .clipShape(Circle())
                        
                        Text("Clipped Text")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Capsule())
                        
                        Rectangle()
                            .fill(Color.purple)
                            .frame(width: 100, height: 100)
                            .mask {
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 80))
                            }
                    }
                }
                
                GroupBox("Blend Modes") {
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 100, height: 100)
                            .offset(x: -25)
                        
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 100, height: 100)
                            .offset(x: 25)
                            .blendMode(.multiply)
                    }
                }
                
                GroupBox("Effects") {
                    VStack(spacing: 20) {
                        Text("Blur Effect")
                            .padding()
                            .background(Color.orange)
                            .blur(radius: 2)
                        
                        Text("Opacity")
                            .padding()
                            .background(Color.red)
                            .opacity(0.5)
                        
                        Text("Brightness")
                            .padding()
                            .background(Color.blue)
                            .brightness(0.3)
                        
                        Text("Contrast")
                            .padding()
                            .background(Color.green)
                            .contrast(0.5)
                        
                        Text("Saturation")
                            .padding()
                            .background(Color.purple)
                            .saturation(0.5)
                        
                        Text("Grayscale")
                            .padding()
                            .background(Color.orange)
                            .grayscale(0.8)
                    }
                }
                
                GroupBox("Transforms") {
                    VStack(spacing: 30) {
                        Text("Scale")
                            .scaleEffect(1.5)
                            .frame(height: 40)
                        
                        Text("Scale X")
                            .scaleEffect(x: 2, y: 1)
                        
                        Text("Rotation")
                            .rotationEffect(.degrees(45))
                            .frame(height: 60)
                        
                        Text("3D Rotation")
                            .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
                        
                        Text("Offset")
                            .offset(x: 50, y: 0)
                            .background(Color.gray.opacity(0.2))
                    }
                }
                
                GroupBox("Materials") {
                    VStack(spacing: 20) {
                        ZStack {
                            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                            
                            VStack(spacing: 10) {
                                Text("Ultra Thin")
                                    .padding()
                                    .background(.ultraThinMaterial)
                                
                                Text("Thin")
                                    .padding()
                                    .background(.thinMaterial)
                                
                                Text("Regular")
                                    .padding()
                                    .background(.regularMaterial)
                                
                                Text("Thick")
                                    .padding()
                                    .background(.thickMaterial)
                                
                                Text("Ultra Thick")
                                    .padding()
                                    .background(.ultraThickMaterial)
                            }
                        }
                        .frame(height: 300)
                        .cornerRadius(20)
                    }
                }
                
                GroupBox("Drawing & Compositing") {
                    VStack(spacing: 20) {
                        Text("Drawing Group")
                            .padding()
                            .background(Color.blue)
                            .drawingGroup()
                        
                        Text("Compositing Group")
                            .padding()
                            .background(Color.green)
                            .compositingGroup()
                            .opacity(0.8)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Modifiers & Styling")
    }
}

// MARK: - Alerts
struct AlertsView: View {
    @State private var showAlert = false
    @State private var showConfirmation = false
    @State private var showSheet = false
    @State private var showFullScreen = false
    @State private var showPopover = false
    @State private var showActionSheet = false
    @State private var alertInput = ""
    
    var body: some View {
        VStack(spacing: 20) {
            GroupBox("Alerts") {
                VStack(spacing: 10) {
                    Button("Show Alert") {
                        showAlert = true
                    }
                    .alert("Alert Title", isPresented: $showAlert) {
                        Button("OK") { }
                        Button("Cancel", role: .cancel) { }
                    } message: {
                        Text("Alert message goes here")
                    }
                    
                    Button("Show Input Alert") {
                        showAlert = true
                    }
                    .alert("Enter Text", isPresented: $showAlert) {
                        TextField("Enter something", text: $alertInput)
                        Button("Submit") { }
                        Button("Cancel", role: .cancel) { }
                    }
                }
            }
            
            GroupBox("Confirmations") {
                Button("Show Confirmation") {
                    showConfirmation = true
                }
                .confirmationDialog("Choose an option", isPresented: $showConfirmation, titleVisibility: .visible) {
                    Button("Option 1") { }
                    Button("Option 2") { }
                    Button("Delete", role: .destructive) { }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Select an action from the options below")
                }
            }
            
            GroupBox("Sheets & Presentations") {
                VStack(spacing: 10) {
                    Button("Show Sheet") {
                        showSheet = true
                    }
                    .sheet(isPresented: $showSheet) {
                        if #available(iOS 16.0, *) {
                            SheetView(isPresented: $showSheet)
                                .presentationDetents([.medium, .large])
                                .presentationDragIndicator(.visible)
                                .presentationCornerRadius(30)
                                .presentationBackground(.thinMaterial)
                        } else {
                            SheetView(isPresented: $showSheet)
                        }
                    }
                    
                    Button("Show Full Screen") {
                        showFullScreen = true
                    }
                    .fullScreenCover(isPresented: $showFullScreen) {
                        if #available(iOS 16.4, *) {
                            FullScreenView(isPresented: $showFullScreen)
                                .presentationBackground(.black)
                        } else {
                            FullScreenView(isPresented: $showFullScreen)
                        }
                    }
                    
                    Button("Show Popover") {
                        showPopover = true
                    }
                    .popover(isPresented: $showPopover) {
                        if #available(iOS 16.4, *) {
                            PopoverView()
                                .presentationCompactAdaptation(.sheet)
                        } else {
                            PopoverView()
                        }
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Alerts & Presentations")
    }
}

struct SheetView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sheet Content")
                    .font(.largeTitle)
                
                Text("This sheet supports multiple detents")
                    .foregroundStyle(.secondary)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Sheet")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        isPresented = false
                    }
                }
            }
        }
    }
}

struct FullScreenView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("Full Screen Content")
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            Button("Dismiss") {
                isPresented = false
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct PopoverView: View {
    var body: some View {
        VStack {
            Text("Popover Content")
                .font(.headline)
            
            Text("This adapts to sheet on iPhone")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(width: 200, height: 100)
    }
}

// MARK: - Data Flow
struct DataFlowView: View {
    @StateObject private var viewModel = DataFlowViewModel()
    @AppStorage("savedValue") private var savedValue = "Default"
    @SceneStorage("sceneValue") private var sceneValue = "Scene Default"
    
    var body: some View {
        Form {
            Section("State Management") {
                Text("Count: \(viewModel.count)")
                Button("Increment") {
                    viewModel.increment()
                }
            }
            
            Section("Storage") {
                LabeledContent("AppStorage", value: savedValue)
                TextField("App Storage Value", text: $savedValue)
                
                LabeledContent("SceneStorage", value: sceneValue)
                TextField("Scene Storage Value", text: $sceneValue)
            }
            
            Section("Environment") {
                DataFlowChildView()
                    .environmentObject(viewModel)
            }
            
            Section("Preferences") {
                PreferenceKeyExample()
            }
        }
        .navigationTitle("Data Flow")
    }
}

class DataFlowViewModel: ObservableObject {
    @Published var count = 0
    
    func increment() {
        count += 1
    }
}

struct DataFlowChildView: View {
    @EnvironmentObject var viewModel: DataFlowViewModel
    
    var body: some View {
        Text("Count from Environment: \(viewModel.count)")
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct PreferenceKeyExample: View {
    @State private var textSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text("This text reports its size")
                .padding()
                .background(Color.blue.opacity(0.3))
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .preference(key: SizePreferenceKey.self, value: geometry.size)
                    }
                )
            
            Text("Size: \(Int(textSize.width)) × \(Int(textSize.height))")
                .font(.caption)
        }
        .onPreferenceChange(SizePreferenceKey.self) { size in
            textSize = size
        }
    }
}

// MARK: - Accessibility
struct AccessibilityView: View {
    @State private var sliderValue = 0.5
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GroupBox("Labels & Hints") {
                    VStack(spacing: 15) {
                        Image(systemName: "star.fill")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                            .accessibilityLabel("Favorite")
                            .accessibilityHint("Double tap to remove from favorites")
                        
                        Text("Important Information")
                            .accessibilityAddTraits(.isHeader)
                        
                        Button("Custom Action") { }
                            .accessibilityLabel("Perform custom action")
                            .accessibilityHint("This will execute a special operation")
                    }
                }
                
                GroupBox("Values & Traits") {
                    VStack(spacing: 15) {
                        Slider(value: $sliderValue)
                            .accessibilityValue("\(Int(sliderValue * 100)) percent")
                            .accessibilityAdjustableAction { direction in
                                switch direction {
                                case .increment:
                                    sliderValue = min(1, sliderValue + 0.1)
                                case .decrement:
                                    sliderValue = max(0, sliderValue - 0.1)
                                @unknown default:
                                    break
                                }
                            }
                        
                        Text("Status: Active")
                            .accessibilityAddTraits(.updatesFrequently)
                        
                        Button("Play") { }
                            .accessibilityAddTraits(.startsMediaSession)
                    }
                }
                
                GroupBox("Custom Actions") {
                    Image(systemName: "photo")
                        .font(.system(size: 100))
                        .accessibilityLabel("Photo")
                        .accessibilityActions {
                            Button("Share") { }
                            Button("Delete") { }
                            Button("Edit") { }
                        }
                }
                
                GroupBox("Hidden & Combined") {
                    VStack {
                        HStack {
                            Image(systemName: "clock")
                            Text("10:30 AM")
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("Time: 10:30 AM")
                        
                        Text("Decorative element")
                            .foregroundStyle(.tertiary)
                            .accessibilityHidden(true)
                    }
                }
                
                GroupBox("Rotor") {
                    Text("Content with custom rotor")
                        .accessibilityRotor("Headings") {
                            // Custom rotor entries
                        }
                }
            }
            .padding()
        }
        .navigationTitle("Accessibility")
    }
}

// MARK: - Platform Integration
struct PlatformView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GroupBox("UIKit Integration") {
                    Text("UIViewRepresentable Example")
                        .foregroundStyle(.secondary)
                    
                    UIKitViewExample()
                        .frame(height: 100)
                        .background(Color.gray.opacity(0.1))
                }
                
                GroupBox("Background Tasks") {
                    Button("Schedule Background Task") {
                        // Background task scheduling
                    }
                    .buttonStyle(.bordered)
                }
                
                GroupBox("URL Handling") {
                    Link("Open Apple.com", destination: URL(string: "https://apple.com")!)
                        .buttonStyle(.bordered)
                }
                
                GroupBox("App Storage") {
                    Text("UserDefaults and other storage examples")
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
        }
        .navigationTitle("Platform Integration")
        .onOpenURL { url in
            print("Opened URL: \(url)")
        }
    }
}

// UIKit Integration Example
struct UIKitViewExample: UIViewRepresentable {
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = "UIKit Label in SwiftUI"
        label.textAlignment = .center
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        // Update the view
    }
}

// Custom Layout Example
struct FlowLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        // Implementation
        return .zero
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        // Implementation
    }
}

// Custom Shape
struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

// Custom ViewModifier
struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.purple.opacity(0.3))
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}
